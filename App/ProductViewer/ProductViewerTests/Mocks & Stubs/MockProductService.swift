import Foundation
import Combine
@testable import ProductViewer

final class MockProductService {
    private let getProductsSubject = PassthroughSubject<EventState<[Product], Error>, Never>()
    private let getProductSubject = PassthroughSubject<EventState<Product, Error>, Never>()
    
    func injectGetProductsEvent(_ event: EventState<[Product], Error>) {
        getProductsSubject.send(event)
    }
    
    func injectGetProductEvent(_ event: EventState<Product, Error>) {
        getProductSubject.send(event)
    }
}

extension MockProductService: ProductServicing {
    func getProducts() -> AnyPublisher<EventState<[Product], Error>, Never> {
        return getProductsSubject
            .prepend(.inProgress)
            .eraseToAnyPublisher()
    }
    
    func getProduct(productID: Int) -> AnyPublisher<EventState<Product, Error>, Never> {
        return getProductSubject
            .prepend(.inProgress)
            .eraseToAnyPublisher()
    }
}
