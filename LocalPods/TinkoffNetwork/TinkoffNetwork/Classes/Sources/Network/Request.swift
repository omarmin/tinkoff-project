import Foundation

public typealias Parameters = [String: String]

public protocol IRequest {
    var urlRequest: URLRequest? { get }
}

public struct Request: IRequest {
    var endpoint: Endpoint
    var method: HTTPMethod
    var parameters: Parameters?
    var body: Encodable?

    public init(_ endpoint: Endpoint, method: HTTPMethod = .get, parameters: Parameters? = nil, body: Encodable? = nil) {
        self.endpoint = endpoint
        self.method = method
        self.parameters = parameters
        self.body = body
    }

    public var urlRequest: URLRequest? {
        var urlComponents = URLComponents(url: endpoint.fullUrl, resolvingAgainstBaseURL: false)
        
        if let parameters = parameters {
            var queryItems: [URLQueryItem] = []
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: value)
                queryItems.append(queryItem)
            }
            urlComponents?.queryItems = queryItems
        }

        guard let url = urlComponents?.url else { return nil }
        var urlRequest = URLRequest(url: url)

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = body?.jsonData
        urlRequest.timeoutInterval = 60
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
