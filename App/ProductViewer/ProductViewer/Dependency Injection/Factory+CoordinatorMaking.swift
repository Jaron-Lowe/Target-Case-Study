import UIKit
import XCoordinator

protocol CoordinatorMaking {
    func makeDealsCoordinator() -> ProductsCoordinator
}

extension Factory: CoordinatorMaking {
    
    func makeDealsCoordinator() -> ProductsCoordinator {
        return DealsCoordinator(factory: self, rootViewController: PVNavigationController())
    }
}
