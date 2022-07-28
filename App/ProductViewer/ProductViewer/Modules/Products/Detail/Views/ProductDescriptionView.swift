import UIKit

final class ProductDescriptionView: CardView {
    // MARK: Properties
    private(set) lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16.0
        return stack
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .Details.emphasis
        label.textColor = .assetColor(.labelPrimary)
        label.text = NSLocalizedString("Product details", comment: "The title of the product details card.")
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .Details.copy2
        label.textColor = .assetColor(.labelQuaternary)
        label.backgroundColor = .assetColor(.backgroundTertiary)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: Init
    override init(shouldHideTopDivider: Bool = false, shouldHideBottomDivider: Bool = false) {
        super.init(shouldHideTopDivider: shouldHideTopDivider, shouldHideBottomDivider: shouldHideBottomDivider)
        
        layoutMargins = UIEdgeInsets(top: 20.0, left: 16.0, bottom: 16.0, right: 16.0)
        
        setUpSubviews()
    }
    
    // MARK: Action Methods
    func configure(model: Product) {
        descriptionLabel.text = model.description
        descriptionLabel.backgroundColor = .clear
    }
}

private extension ProductDescriptionView {
    func setUpSubviews() {
        addAndPinSubviewToMargins(contentStack)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(descriptionLabel)
        
    }
}
