import Foundation
import Combine
import XCoordinator
import SimpleApiClient

final class ProductDetailViewModel {
    // MARK: Properties
    private let router: WeakRouter<ProductsRoute>
    private let productService: ProductServicing
    private let productID: Int
    
    // MARK: Init
    init(router: WeakRouter<ProductsRoute>, productService: ProductServicing, productID: Int) {
        self.router = router
        self.productService = productService
        self.productID = productID
    }
}

extension ProductDetailViewModel: ViewModelTransformer {
    struct Inputs {
        let viewDidLoads: AnyPublisher<Void, Never>
    }
    
    struct Compositions {
        let getProductResult: AnyPublisher<AsyncResult<Product, Error>, Never>
    }
    
    struct Outputs {
        let isLoading: AnyPublisher<Bool, Never>
        let product: AnyPublisher<Product, Never>
        let errorToDisplay: AnyPublisher<Error, Never>
    }
    
    func transform(inputs: Inputs) -> Outputs {
        let compositions = Compositions(
            getProductResult: getProductResult(inputs: inputs, productID: productID)
        )
        return Outputs(
            isLoading: isLoading(compositions: compositions),
            product: product(compositions: compositions),
            errorToDisplay: errorToDisplay(compositions: compositions)
        )
    }
}

private extension ProductDetailViewModel {
    // MARK: Compositions
    func getProductResult(inputs: Inputs, productID: Int) -> AnyPublisher<AsyncResult<Product, Error>, Never> {
        return inputs.viewDidLoads
            .map { [service = self.productService] _ in
                return service.getProduct(productID: productID)
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
    }
    
    // MARK: Outputs
    func isLoading(compositions: Compositions) -> AnyPublisher<Bool, Never> {
        return compositions.getProductResult
            .map { $0.isInProgress }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func product(compositions: Compositions) -> AnyPublisher<Product, Never> {
        return compositions.getProductResult
            .compactMap { $0.successValue }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func errorToDisplay(compositions: Compositions) -> AnyPublisher<Error, Never> {
        return compositions.getProductResult
            .compactMap { $0.failureValue }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
