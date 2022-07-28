import Foundation

struct GetDealsApi: HttpApiRequest {
    var endpointPath: String {
        return "deals"
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var headers: HttpHeaders?
    
    var parameters: HttpParameters?
    
}
