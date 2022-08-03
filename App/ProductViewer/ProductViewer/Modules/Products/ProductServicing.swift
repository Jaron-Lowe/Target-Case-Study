import Foundation
import Combine
import SimpleApiClient

protocol ProductServicing {
    func getProducts() -> AnyPublisher<AsyncResult<[Product], Error>, Never>
    func getProduct(productID: Int) -> AnyPublisher<AsyncResult<Product, Error>, Never>
}
