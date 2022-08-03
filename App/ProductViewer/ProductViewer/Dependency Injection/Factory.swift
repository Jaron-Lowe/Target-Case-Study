import Foundation

final class Factory {
    // MARK: Properties
    let container: DIContainering
    
    // MARK: Init
    init(container: DIContainering? = nil) {
        if let container = container {
            self.container = container
        } else {
            self.container = DIContainer.shared
        }
    }
}
