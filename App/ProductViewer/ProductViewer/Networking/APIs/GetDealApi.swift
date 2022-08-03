import Foundation
import SimpleApiClient

struct GetDealApi {
    // MARK: Properties
    let productID: Int
    
    // MARK: Init
    init(productID: Int) {
        self.productID = productID
    }
}

extension GetDealApi: HttpApiRequest {
    typealias ResponseType = Product
    
    var endpointPath: String {
        return "deals/{productID}".replacingOccurrences(of: "{productID}", with: "\(productID)")
    }
    
    var method: HttpMethod {
        return .get
    }
}
