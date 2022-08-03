import UIKit
import XCoordinator

final class DealsCoordinator: ProductsCoordinator {
    // MARK: ProductsCoordinator
    override func prepareListTransition() -> NavigationTransition {
        return .set([factory.makeDealsListViewController(router: weakRouter)])
    }
    
    override func prepareDetailTransition(productID: Int) -> NavigationTransition {
        return .push(factory.makeDealsDetailViewController(router: weakRouter, productID: productID))
    }
}
