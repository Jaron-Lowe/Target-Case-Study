import UIKit
import NukeExtensions

final class ProductHeroView: CardView {
    // MARK: Properties
    private(set) lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16.0
        return stack
    }()
    
    private(set) lazy var imageView = ProductImageView()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .Details.emphasis
        label.textColor = .assetColor(.labelPrimary)
        label.numberOfLines = 3
        return label
    }()
    
    private(set) lazy var priceAndFullfillmentStack = PriceAndFulfillmentStackView()
    
    // MARK: Init
    override init(shouldHideTopDivider: Bool = false, shouldHideBottomDivider: Bool = false) {
        super.init(shouldHideTopDivider: shouldHideTopDivider, shouldHideBottomDivider: shouldHideBottomDivider)
        
        setUpSubviews()
    }
    
    // MARK: Action Methods
    func configure(model: Product) {
        NukeExtensions.loadImage(with: model.imageUrl, options: .fadeInOptions, into: imageView)
        titleLabel.text = model.title
        priceAndFullfillmentStack.configure(model: model)
    }
}

private extension ProductHeroView {
    func setUpSubviews() {
        addAndPinSubviewToMargins(contentStack)
        contentStack.addArrangedSubview(imageView)
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(priceAndFullfillmentStack)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
}
