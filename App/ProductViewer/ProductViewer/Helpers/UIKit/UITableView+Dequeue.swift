import UIKit

extension UITableView {
    func dequeueCell<Cell: UITableViewCell>(of type: Cell.Type) -> Cell {
        guard let dequeuedCell = dequeueReusableCell(withIdentifier: Cell.reuseIdentifier) else {
            fatalError("No cell with the specified reuse identifier was dequeued.")
        }
        
        guard let cell = dequeuedCell as? Cell else {
            fatalError("Invalid cell type was dequeued. Found: \(dequeuedCell.self) Expected: \(Cell.self)")
        }
        
        return cell
    }
}
