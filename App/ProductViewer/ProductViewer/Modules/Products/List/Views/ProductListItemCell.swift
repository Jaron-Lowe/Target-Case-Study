import UIKit
import NukeExtensions

final class ProductListItemView: NiblessUIView {
    // MARK: Properties
    private(set) lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.spacing = 16.0
        stack.prepareForAutolayout()
        return stack
    }()
    
    private(set) lazy var imageView = ProductImageView()
    
    private(set) lazy var detailStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8.0
        return stack
    }()
    
    private(set) lazy var priceAndFulfillmentStack = PriceAndFulfillmentStackView()
    
    private(set) lazy var fulfillmentLabel: UILabel = {
        let label = UILabel()
        label.font = .small
        label.textColor = .assetColor(.labelTertiary)
        return label
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .medium
        label.textColor = .assetColor(.labelPrimary)
        label.numberOfLines = 3
        return label
    }()
    
    private(set) lazy var availabilityLabel: UILabel = {
        let label = UILabel()
        label.font = .small
        label.textColor = .assetColor(.labelTertiary)
        return label
    }()
    
    // MARK: Init
    override init() {
        
        super.init()
        
        addAndPinSubview(contentStack, insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        contentStack.addArrangedSubview(imageView)
        contentStack.addArrangedSubview(detailStack)
        detailStack.addArrangedSubview(priceAndFulfillmentStack)
        priceAndFulfillmentStack.addArrangedSubview(fulfillmentLabel)
        detailStack.addArrangedSubview(titleLabel)
        detailStack.addArrangedSubview(availabilityLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 140.0),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        ])
    }
}

final class ProductListItemCell: NiblessTableViewCell {
    // MARK: Properties
    private lazy var itemView: ProductListItemView = {
        let view = ProductListItemView()
        view.prepareForAutolayout()
        return view
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addAndPinSubview(itemView)
    }
    
    // MARK: Action Methods
    func configure(model: Product) {
        NukeExtensions.loadImage(with: URL(string: model.imageUrl), options: .fadeInOptions, into: itemView.imageView)
        itemView.priceAndFulfillmentStack.configure(model: model)
        itemView.titleLabel.text = model.title
        itemView.availabilityLabel.attributedText = model.aisleAvailabilityText
    }
}
