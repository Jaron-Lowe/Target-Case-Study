import UIKit

final class ProductDetailView: NiblessUIView {
    // MARK: Properties
    private(set) lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private(set) lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16.0
        return stack
    }()
    
    private(set) lazy var productHeroView = ProductHeroView()
    private(set) lazy var productDescriptionView = ProductDescriptionView()
    private(set) lazy var addToCartButtonContainer = AddToCartButtonContainer()
    
    // MARK: Init
    override init() {
        super.init()
        
        backgroundColor = .assetColor(.backgroundPrimary)
        setUpSubviews()
    }
    
    // MARK: Action Methods
    func configure(model: Product) {
        productHeroView.configure(model: model)
        productDescriptionView.configure(model: model)
    }
}

private extension ProductDetailView {
    func setUpSubviews() {
        addAndPinSubview(scrollView, edges: [.left, .right, .top])
        scrollView.addAndPinSubview(contentStack, edges: [.top, .bottom], insets: UIEdgeInsets(top: 0, left: 0, bottom: 16.0, right: 0))
        contentStack.addArrangedSubview(productHeroView)
        contentStack.addArrangedSubview(productDescriptionView)
        addAndPinSubview(addToCartButtonContainer, edges: [.left, .right, .bottom])
        
        let contentWidthConstraint = contentStack.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        contentWidthConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            scrollView.bottomAnchor.constraint(equalTo: addToCartButtonContainer.topAnchor),
            contentWidthConstraint,
            contentStack.widthAnchor.constraint(lessThanOrEqualToConstant: 500.0),
            contentStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentStack.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor),
            contentStack.trailingAnchor.constraint(greaterThanOrEqualTo: scrollView.trailingAnchor)
        ])
    }
}
