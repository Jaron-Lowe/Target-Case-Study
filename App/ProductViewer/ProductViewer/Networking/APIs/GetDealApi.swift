import Foundation

struct GetDealApi {
    // MARK: Properties
    let productID: Int
    
    // MARK: Init
    init(productID: Int) {
        self.productID = productID
    }
}

extension GetDealApi: HttpApiRequest {
    var endpointPath: String {
        return "deals/{productID}".replacingOccurrences(of: "{productID}", with: "\(productID)")
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var headers: HttpHeaders? {
        return nil
    }
    
    var parameters: HttpParameters? {
        return nil
    }
    
}
