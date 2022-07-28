import UIKit

enum AssetColor: String {
    case backgroundPrimary
    case backgroundSecondary
    case backgroundTertiary
    case labelGreen
    case labelPrimary
    case labelSecondary
    case labelTertiary
    case labelQuaternary
    case lineSeparator
    case onTargetRed500
    case targetRed500
    case targetRed700
}

extension UIColor {
    static func assetColor(_ color: AssetColor) -> UIColor {
        guard let value = UIColor(named: color.rawValue) else {
            #if DEBUG
                fatalError("Could not parse the color: \(color) from the project assets.")
            #else
                return .yellow
            #endif
        }
        return value
    }
}
