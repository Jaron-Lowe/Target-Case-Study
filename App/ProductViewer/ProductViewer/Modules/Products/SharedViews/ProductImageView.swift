import UIKit

class ProductImageView: NiblessUIImageView {
    // MARK: Properties
    override init() {
        super.init()
        
        backgroundColor = .assetColor(.backgroundTertiary)
        clipsToBounds = true
        layer.cornerRadius = 8.0
        contentMode = .scaleAspectFill
    }
}
