import Foundation

protocol ServiceResolving {
    func resolveDealsService() -> DealsServicing
}

extension Factory: ServiceResolving {
    func resolveDealsService() -> DealsServicing {
        return container.resolve(type: DealsServicing.self, maker: makeDealsService)
    }
    
    private func makeDealsService() -> DealsServicing {
        return DealsService(factory: self)
    }
}
