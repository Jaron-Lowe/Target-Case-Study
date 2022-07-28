import UIKit

open class NiblessTableViewCell: UITableViewCell {
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("This view should be created programmatically.")
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
