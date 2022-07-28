import Foundation

enum HttpBody {
    case form(body: Encodable)
    case json(body: Encodable)
    
    var contentType: String {
        switch self {
        case .form:
            return "application/x-www-form-urlencoded"
        case .json:
            return "application/json"
        }
    }
}

extension HttpBody: URLRequestApplying {
    func apply(to request: inout URLRequest) {
        // TODO:
    }
}
