import Foundation

public protocol INetworkManager {
    func perform<T>(_ request: IRequest, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable
}

public class NetworkManager: INetworkManager {
    let session = URLSession(configuration: .default)
    
    public init() { }

    public func perform<T>(_ request: IRequest, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        guard let urlRequest = request.urlRequest else { return }
        
        let onMainCompletion = { (result: Result<T, Error>) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            let httpResponse = response as? HTTPURLResponse

            if let error = error {
                onMainCompletion(Result.failure(error))
                return
            }

            guard let data = data else {
                onMainCompletion(Result.failure(TinkoffError.noData))
                return
            }
            
            #if DEBUG
            dump(urlRequest)

            if let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
            #endif

            if httpResponse?.statusCode != 200 {
                onMainCompletion(Result.failure(TinkoffError.unknown))
                return
            }
            
            do {
                #if DEBUG
                // swiftlint:disable force_try
                let model = try! JSONDecoder().decode(T.self, from: data)
                // swiftlint:enable force_try
                #else
                let model = try JSONDecoder().decode(T.self, from: data)
                #endif
                onMainCompletion(Result.success(model))
            } catch {
                onMainCompletion(Result.failure(TinkoffError.unknown))
            }
        }

        task.resume()
    }
}
