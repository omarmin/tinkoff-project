import Foundation

public protocol Endpoint {
    static var baseUrl: URL { get }
    var path: String { get }
    var fullUrl: URL { get }
}

public extension Endpoint {
    var fullUrl: URL {
        return Self.baseUrl.appendingPathComponent(path)
    }
}
