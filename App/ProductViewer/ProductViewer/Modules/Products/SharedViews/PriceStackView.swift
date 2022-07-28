import UIKit

final class PriceStackView: NiblessStackView {
    // MARK: Properties
    private(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .largeBold
        label.textColor = .assetColor(.targetRed700)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.85
        return label
    }()
    
    private(set) lazy var regularPriceLabel: UILabel = {
       let label = UILabel()
        label.font = .small
        label.textColor = .assetColor(.labelSecondary)
        return label
    }()
    
    // MARK: Init
    override init() {
        super.init()
        
        axis = .horizontal
        alignment = .trailing
        spacing = 4.0
        
        addArrangedSubview(priceLabel)
        addArrangedSubview(regularPriceLabel)

    }
    
    // MARK: Action Methods
    func configure(model: Product) {
        if let salePrice = model.salePrice {
            priceLabel.text = salePrice.displayString
            regularPriceLabel.text = NSLocalizedString("reg. {price}", comment: "The label representing a regular product price.")
                .replacingOccurrences(of: "{price}", with: model.regularPrice.displayString)
            regularPriceLabel.isHidden = false
        } else {
            priceLabel.text = model.regularPrice.displayString
            regularPriceLabel.isHidden = true
        }
    }
}
