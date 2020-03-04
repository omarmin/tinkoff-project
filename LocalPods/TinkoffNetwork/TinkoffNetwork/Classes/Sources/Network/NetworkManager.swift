import Foundation

protocol INetworkManager {
    func perform<T>(request: IRequest, completion: @escaping (Result<T, Swift.Error>) -> Void) where T: Decodable
}

class NetworkManager: INetworkManager {
    let session = URLSession(configuration: .default)

    func perform<T>(request: IRequest, completion: @escaping (Result<T, Swift.Error>) -> ()) where T: Decodable {
        guard let urlRequest = request.urlRequest else { return }
        
        let onMainCompletion = { (result: Result<T, Swift.Error>) in
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
                onMainCompletion(Result.failure(Error.noData))
                return
            }
            
            #if DEBUG
            dump(urlRequest)

            if let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
            #endif

            if httpResponse?.statusCode != 200 {
                onMainCompletion(Result.failure(Error.unknown))
                return
            }
            
            do {
                #if DEBUG
                let model = try! JSONDecoder().decode(T.self, from: data)
                #else
                let model = try JSONDecoder().decode(T.self, from: data)
                #endif
                onMainCompletion(Result.success(model))
            } catch {
                onMainCompletion(Result.failure(Error.unknown))
            }
        }

        task.resume()
    }
}
