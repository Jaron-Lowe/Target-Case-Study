import UIKit

open class NiblessUIViewController: UIViewController {
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("This controller should be created programmatically.")
    }
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("This controller should be created programmatically.")
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
}
