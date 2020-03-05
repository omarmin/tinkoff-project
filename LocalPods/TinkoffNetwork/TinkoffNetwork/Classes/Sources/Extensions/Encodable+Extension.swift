import Foundation

extension Encodable {

    var jsonData: Data? {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(self)

        #if DEBUG
        if data == nil {
            fatalError("can't encode")
        }
        #endif

        return data
    }
}
