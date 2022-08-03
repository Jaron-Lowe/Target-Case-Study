import UIKit

open class NiblessUIImageView: UIImageView {
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("This view should be created programmatically.")
    }
    
    public init() {
        super.init(frame: .zero)
    }
}
