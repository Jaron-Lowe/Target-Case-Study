import UIKit

class LineSeparatorView: NiblessUIView {
    // MARK: Init
    override init() {
        super.init()
        
        prepareForAutolayout()
        backgroundColor = .assetColor(.lineSeparator)
        heightAnchor.constraint(equalToConstant: .singlePixel).isActive = true
    }
}
