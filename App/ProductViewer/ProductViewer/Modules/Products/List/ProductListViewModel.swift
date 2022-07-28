import Foundation
import Combine
import CombineExt
import XCoordinator

final class ProductListViewModel: ObservableObject {
    // MARK: Properties
    private let router: WeakRouter<ProductsRoute>
    private let productService: ProductServicing
    
    private var cancellables = Set<AnyCancellable>()
        
    // MARK: Init
    init(router: WeakRouter<ProductsRoute>, productService: ProductServicing) {
        self.router = router
        self.productService = productService
    }
}

extension ProductListViewModel: ViewModelTransformer {
    struct Inputs {
        let viewDidLoads: AnyPublisher<Void, Never>
        let listRefreshes: AnyPublisher<Void, Never>
        let itemSelections: AnyPublisher<IndexPath, Never>
    }
    
    struct Compositions {
        let getProductsResult: AnyPublisher<EventState<[Product], Error>, Never>
    }
    
    struct Outputs {
        let isLoading: AnyPublisher<Bool, Never>
        let listData: AnyPublisher<[Product], Never>
        let errorToDisplay: AnyPublisher<Error, Never>
    }
    
    @discardableResult
    func transform(inputs: Inputs) -> Outputs {
        let compositions = Compositions(
            getProductsResult: getProductsResult(inputs: inputs)
        )
        let outputs = Outputs(
            isLoading: isLoading(compositions: compositions),
            listData: listData(compositions: compositions),
            errorToDisplay: errorToDisplay(compositions: compositions)
        )
        setUpSubscriptions(inputs: inputs, outputs: outputs)
        return outputs
    }
}

private extension ProductListViewModel {
    // MARK: Subscriptions
    func setUpSubscriptions(inputs: Inputs, outputs: Outputs) {
        inputs.itemSelections
            .withLatestFrom(outputs.listData, resultSelector: { (indexPath: $0, listData:$1) })
            .compactMap { values -> Int? in
                let (indexPath, listData) = values
                guard indexPath.row < listData.count else { return nil }
                return listData[indexPath.row].id
            }
            .sink { [weak self] itemID in
                self?.router.trigger(.detail(itemID))
            }
            .store(in: &cancellables)
    }
    
    // MARK: Compositions
    func getProductsResult(inputs: Inputs) -> AnyPublisher<EventState<[Product], Error>, Never> {
        return Publishers.Merge(
            inputs.viewDidLoads,
            inputs.listRefreshes
        )
            .map { [service = self.productService] _ in
                return service.getProducts()
            }
            .switchToLatest()
            .share()
            .eraseToAnyPublisher()
    }
    
    // MARK: Outputs
    func isLoading(compositions: Compositions) -> AnyPublisher<Bool, Never> {
        return compositions.getProductsResult
            .map { $0.isInProgress }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func listData(compositions: Compositions) -> AnyPublisher<[Product], Never> {
        return compositions.getProductsResult
            .map {
                switch $0 {
                case .inProgress, .failure:
                    return []
                case .success(let items):
                    return items
                }
            }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func errorToDisplay(compositions: Compositions) -> AnyPublisher<Error, Never> {
        return compositions.getProductsResult
            .compactMap { $0.failure }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

