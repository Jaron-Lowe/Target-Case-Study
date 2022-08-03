import UIKit

final class PriceAndFulfillmentStackView: NiblessStackView {
    // MARK: Properties
    private(set) lazy var priceStack: PriceStackView = PriceStackView()
    
    private(set) lazy var fulfillmentLabel: UILabel = {
        let label = UILabel()
        label.font = .small
        label.textColor = .assetColor(.labelTertiary)
        return label
    }()
    
    // MARK: Init
    override init() {
        super.init()
        
        axis = .vertical
        alignment = .leading
        
        addArrangedSubview(priceStack)
        addArrangedSubview(fulfillmentLabel)
    }
    
    // MARK: Action Methods
    func configure(model: Product) {
        priceStack.configure(model: model)
        fulfillmentLabel.text = model.fulfillment
    }
}
