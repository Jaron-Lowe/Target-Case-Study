import Foundation
import Combine
import SimpleApiClient

protocol DealsServicing: ProductServicing {}

final class DealsService: DealsServicing {
    // MARK: Properties
    let factory: ApiMaking
    
    // MARK: Init
    init(factory: ApiMaking) {
        self.factory = factory
    }
    
    func getProducts() -> AnyPublisher<AsyncResult<[Product], Error>, Never> {
        return factory.resolveTargetApiClient()
            .send(
                api: factory.makeGetDealsApi(),
                keyPath: \.products
            )
            .eraseToAnyPublisher()
    }

    func getProduct(productID: Int) -> AnyPublisher<AsyncResult<Product, Error>, Never> {
        return factory.resolveTargetApiClient()
            .send(api: factory.makeGetDealApi(productID: productID))
    }
}
