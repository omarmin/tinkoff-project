import Foundation

protocol Endpoint {
    static var baseUrl: URL { get }
    var path: String { get }
    var fullUrl: URL { get }
}

extension Endpoint {
    var fullUrl: URL {
        return Self.baseUrl.appendingPathComponent(path)
    }
}
