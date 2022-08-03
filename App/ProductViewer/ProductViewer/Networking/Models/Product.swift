import Foundation
import SwiftUI

struct ProductResponse: Decodable {
    let products: [Product]
}

struct Product: Decodable, Hashable {
    let id: Int
    let title: String
    let aisle: String
    let description: String
    let imageUrl: String
    let regularPrice: Price
    let salePrice: Price?
    let fulfillment: String
    var availability: ProductAvailability = .outOfStock
    
    var aisleAvailabilityText: NSAttributedString {
        switch availability {
        case .inStock:
            let templateString = NSLocalizedString("{availability} in aisle {aisle}", comment: "Text of product's aisle availability label.")
                .replacingOccurrences(of: "{aisle}", with: aisle.uppercased())
            let attributedString = NSMutableAttributedString(string: templateString)
            if let range = templateString.range(of: "{availability}") {
                let availabilityRange = NSRange(range, in: templateString)
                attributedString.replaceCharacters(in: availabilityRange, with: availability.title)
                return attributedString
            }
            return NSAttributedString(string: templateString.replacingOccurrences(of: "{availability}", with: availability.title.string))
        case .outOfStock:
            return availability.title
        }
    }
}

struct Price: Decodable, Hashable {
    let amountInCents: Int
    let currencySymbol: String
    let displayString: String
}

enum ProductAvailability: String, Decodable {
    case inStock = "In stock"
    case outOfStock = "Out of stock"
    
    var title: NSAttributedString {
        let titleValue: String
        let color: UIColor
        switch self {
           
        case .inStock:
            color = .assetColor(.labelGreen)
            titleValue = NSLocalizedString("In stock", comment: "Text of a product's availability when in stock.")
        case .outOfStock:
            color = .assetColor(.targetRed500)
            titleValue = NSLocalizedString("Out of stock", comment: "Text of a product's availability when out of stock.")
        }
        let attributedString = NSMutableAttributedString(string: titleValue)
        attributedString.addAttribute(.foregroundColor, value: color, range: NSRange(location: 0, length: titleValue.count))
        return attributedString
    }
}
