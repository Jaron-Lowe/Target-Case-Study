import Foundation
import Combine

protocol ProductServicing {
    func getProducts() -> AnyPublisher<EventState<[Product], Error>, Never>
    func getProduct(productID: Int) -> AnyPublisher<EventState<Product, Error>, Never>
}
