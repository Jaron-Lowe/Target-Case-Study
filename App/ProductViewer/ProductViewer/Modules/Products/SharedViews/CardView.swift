import UIKit

class CardView: NiblessUIView {
    // MARK: Properties
    private lazy var topDivider = LineSeparatorView()
    private lazy var bottomDivider = LineSeparatorView()
    
    // MARK: Init
    init(shouldHideTopDivider: Bool = false, shouldHideBottomDivider: Bool = false) {
        super.init()
        
        layoutMargins = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        backgroundColor = .assetColor(.backgroundSecondary)
        
        topDivider.isHidden = shouldHideTopDivider
        bottomDivider.isHidden = shouldHideBottomDivider
        setUpSubViews()
    }
}

private extension CardView {
    func setUpSubViews() {
        addAndPinSubview(topDivider, edges: [.left, .right, .top])
        addAndPinSubview(bottomDivider, edges: [.left, .right, .bottom])
    }
}
