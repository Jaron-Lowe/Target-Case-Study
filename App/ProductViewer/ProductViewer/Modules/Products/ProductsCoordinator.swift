import UIKit
import XCoordinator

enum ProductsRoute: Route {
    case list
    case detail(Int)
}

class ProductsCoordinator: NavigationCoordinator<ProductsRoute> {
    // MARK: Properties
    let factory: Factory
    
    // MARK: Init
    init(factory: Factory, rootViewController: UINavigationController) {
        self.factory = factory
        
        super.init(rootViewController: rootViewController)
    }
    
    // MARK: NavigationCoordinator
    override func prepareTransition(for route: ProductsRoute) -> NavigationTransition {
        switch route {
        case .list:
            return prepareListTransition()
        case .detail(let productID):
            return prepareDetailTransition(productID: productID)
        }
    }
    
    // MARK: Action Methods
    func prepareListTransition() -> NavigationTransition {
        fatalError("This Coordinator should be overwritten by a specific type of product servicing implementation.")
    }
    
    func prepareDetailTransition(productID: Int) -> NavigationTransition {
        fatalError("This Coordinator should be overwritten by a specific type of product servicing implementation.")
    }
}
