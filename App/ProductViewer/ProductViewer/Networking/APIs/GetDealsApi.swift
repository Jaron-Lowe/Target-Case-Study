import Foundation
import SimpleApiClient

struct GetDealsApi: HttpApiRequest {
    typealias ResponseType = ProductResponse
    
    var endpointPath: String {
        return "deals"
    }
    
    var method: HttpMethod {
        return .get
    }
}
