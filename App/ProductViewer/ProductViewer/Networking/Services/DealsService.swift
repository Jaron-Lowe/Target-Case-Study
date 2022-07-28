import Foundation
import Combine

protocol DealsServicing: ProductServicing {}

final class DealsService: DealsServicing {
    // MARK: Properties
    let factory: ApiMaking
    
    // MARK: Init
    init(factory: ApiMaking) {
        self.factory = factory
    }
    
    func getProducts() -> AnyPublisher<EventState<[Product], Error>, Never> {
        return factory.resolveTargetApiClient()
            .send(
                api: factory.makeGetDealsApi(),
                for: ProductResponse.self,
                keyPath: \ProductResponse.products
            )
            .eraseToAnyPublisher()
    }

    func getProduct(productID: Int) -> AnyPublisher<EventState<Product, Error>, Never> {
        return factory.resolveTargetApiClient()
            .send(
                api: factory.makeGetDealApi(productID: productID),
                for: Product.self
            )
    }
}
