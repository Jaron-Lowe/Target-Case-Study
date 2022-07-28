import UIKit

final class AddToCartButtonContainer: NiblessUIView {
    // MARK: Properties
    private lazy var roundingView: UIView = {
        let view = UIView()
        view.backgroundColor = .assetColor(.backgroundSecondary)
        view.clipsToBounds = true
        view.layer.cornerRadius = 12.0
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private lazy var buttonContainingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layoutMargins = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        return view
    }()
    
    private(set) lazy var addToCartButton: FilledButton = {
        let button = FilledButton()
        button.setTitle(NSLocalizedString("Add to cart", comment: "Title of an add to cart button."), for: .normal)
        return button
    }()
    
    // MARK: Init
    override init() {
        super.init()
        
        backgroundColor = .clear
        // TODO: Confrim why shadowPath is not working
        //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        layer.shadowOpacity = 0.6
        layer.shadowRadius = 6.0
        clipsToBounds = false
        
        setUpSubviews()
    }
}

private extension AddToCartButtonContainer {
    func setUpSubviews() {
        addAndPinSubview(roundingView)
        roundingView.addAndPinSubview(buttonContainingView, edges: [.left, .right, .top])
        buttonContainingView.addAndPinSubviewToMargins(addToCartButton)
        
        NSLayoutConstraint.activate([
            buttonContainingView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
