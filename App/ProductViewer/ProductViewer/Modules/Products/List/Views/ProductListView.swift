import UIKit

final class ProductListView: NiblessUIView {
    // MARK: Properties
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .assetColor(.backgroundPrimary)
        view.prepareForAutolayout()
        view.alwaysBounceVertical = true
        view.insetsContentViewsToSafeArea = true
        view.register(ProductListItemCell.self, forCellReuseIdentifier: ProductListItemCell.reuseIdentifier)
        view.tableFooterView = UIView()
        return view
    }()
    
    private(set) lazy var refresher: UIRefreshControl = {
        let view = UIRefreshControl()
        view.tintColor = .assetColor(.targetRed500)
        view.layer.zPosition = -1
        return view
    }()
    
    // MARK: Init
    override init() {
        super.init()
                
        backgroundColor = .assetColor(.backgroundPrimary)
        setUpSubviews()
    }
}

private extension ProductListView {
    func setUpSubviews() {
        addAndPinSubview(tableView)
        tableView.addSubview(refresher)
    }
}
