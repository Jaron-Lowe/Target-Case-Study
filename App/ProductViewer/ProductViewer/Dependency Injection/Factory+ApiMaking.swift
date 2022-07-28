import Foundation

protocol ApiMaking {
    func resolveTargetApiClient() -> TargetApiClient
    
    func makeGetDealsApi() -> GetDealsApi
    func makeGetDealApi(productID: Int) -> GetDealApi
}

extension Factory: ApiMaking {
    func resolveTargetApiClient() -> TargetApiClient {
        return container.resolve(type: TargetApiClient.self, maker: makeTargetApiClient)
    }
    
    private func makeTargetApiClient() -> TargetApiClient {
        return TargetApiClient()
    }
    
    func makeGetDealsApi() -> GetDealsApi {
        return GetDealsApi()
    }
    
    func makeGetDealApi(productID: Int) -> GetDealApi {
        return GetDealApi(productID: productID)
    }
}
