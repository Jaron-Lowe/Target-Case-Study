import UIKit
import XCoordinator

protocol DealsViewControllerMaking {
    func makeDealsListViewController(router: WeakRouter<ProductsRoute>) -> ProductListViewController
    func makeDealsDetailViewController(router: WeakRouter<ProductsRoute>, productID: Int) -> ProductDetailViewController
}

extension Factory: DealsViewControllerMaking {
    func makeDealsListViewController(router: WeakRouter<ProductsRoute>) -> ProductListViewController {
        let viewModel = ProductListViewModel(
            router: router,
            productService: resolveDealsService()
        )
        return ProductListViewController(viewModel: viewModel)
    }
    
    func makeDealsDetailViewController(router: WeakRouter<ProductsRoute>, productID: Int) -> ProductDetailViewController {
        let viewModel = ProductDetailViewModel(
            router: router,
            productService: resolveDealsService(),
            productID: productID
        )
        return ProductDetailViewController(viewModel: viewModel)
    }
}
