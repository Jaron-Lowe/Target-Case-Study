import Foundation

enum HttpParameters {
    case query(params: [String: String])
    case body(HttpBody)
}
