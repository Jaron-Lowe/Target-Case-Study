import Foundation

protocol DIContainering {
    func register<T>(type: T.Type, component: Any)
    func resolve<T>(type: T.Type, maker: () -> T) -> T
}

final class DIContainer: DIContainering {
    // MARK: Properties
    static let shared = DIContainer()
    private var components: [String: Any] = [:]
        
    private init() { }
    
    // MARK: DIContainerProtocol
    func register<T>(type: T.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<T>(type: T.Type, maker: () -> T) -> T {
        guard let instance = components["\(type)"] as? T else {
            let newInstance = maker()
            register(type: type, component: newInstance)
            return newInstance
        }
        return instance
    }
}
