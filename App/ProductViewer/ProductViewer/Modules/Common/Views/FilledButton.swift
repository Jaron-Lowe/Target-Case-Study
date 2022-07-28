import UIKit

final class FilledButton: NiblessUIButton {
    // MARK: Init
    override init() {
        super.init()
        
        titleLabel?.font = .Details.emphasis
        setTitleColor(.assetColor(.onTargetRed500), for: .normal)
        backgroundColor = .assetColor(.targetRed500)
        heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        clipsToBounds = true
        layer.cornerRadius = 4.0
    }
}
