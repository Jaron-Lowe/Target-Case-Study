import Foundation
import Combine
@testable import ProductViewer

final class MockProductService {
    private let getProductsSubject = PassthroughSubject<AsyncResult<[Product], Error>, Never>()
    private let getProductSubject = PassthroughSubject<AsyncResult<Product, Error>, Never>()
    
    func injectGetProductsEvent(_ event: AsyncResult<[Product], Error>) {
        getProductsSubject.send(event)
    }
    
    func injectGetProductEvent(_ event: AsyncResult<Product, Error>) {
        getProductSubject.send(event)
    }
}

extension MockProductService: ProductServicing {
    func getProducts() -> AnyPublisher<AsyncResult<[Product], Error>, Never> {
        return getProductsSubject
            .prepend(.inProgress)
            .eraseToAnyPublisher()
    }
    
    func getProduct(productID: Int) -> AnyPublisher<AsyncResult<Product, Error>, Never> {
        return getProductSubject
            .prepend(.inProgress)
            .eraseToAnyPublisher()
    }
}
