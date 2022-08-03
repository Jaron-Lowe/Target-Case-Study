import XCoordinator
import UIKit

final class MockRouter<RouteType: Route>: Router {
    
    // MARK: Properties
    var currentRoute: RouteType?
    var viewController: UIViewController!
    
    // MARK: Router
    func contextTrigger(_ route: RouteType, with options: TransitionOptions, completion: ContextPresentationHandler?) {
        currentRoute = route
    }
    
    var weakRouter: WeakRouter<RouteType> {
        return WeakRouter(self) { $0.strongRouter }
    }
}
