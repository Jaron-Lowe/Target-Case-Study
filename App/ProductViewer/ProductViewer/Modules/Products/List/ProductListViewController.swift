import UIKit
import Combine
import CombineCocoa
import CombineDataSources

final class ProductListViewController: NiblessUIViewController {
    // MARK: Properties
    private let viewModel: ProductListViewModel
    private lazy var contentView = ProductListView()
    
    private let viewDidLoads = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Init
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    // MARK: UIViewController
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("List", comment: "The navbar title of the product list screen.")
        
        setUpBindings()
        
        viewDidLoads.send()
    }
}

private extension ProductListViewController {
    func setUpBindings() {
        let itemSelections = contentView.tableView.didSelectRowPublisher
            .handleEvents(receiveOutput: { [weak self] indexPath in
                self?.contentView.tableView.deselectRow(at: indexPath, animated: true)
            })
            .eraseToAnyPublisher()
                
        let outputs = viewModel.transform(inputs: ProductListViewModel.Inputs(
            viewDidLoads: viewDidLoads.eraseToAnyPublisher(),
            listRefreshes: contentView.refresher.isRefreshingPublisher.map { _ in () }.eraseToAnyPublisher(),
            itemSelections: itemSelections
        ))
        
        let listDataController = TableViewItemsController<[[Product]]>(cellIdentifier: ProductListItemCell.reuseIdentifier, cellType: ProductListItemCell.self, cellConfig: { cell, indexPath, model in
            cell.configure(model: model)
        })
        listDataController.animated = false
        outputs.listData
            .handleEvents(receiveOutput: { [weak self] _ in
                self?.contentView.refresher.endRefreshing()
            })
            .bind(subscriber: contentView.tableView.rowsSubscriber(listDataController))
            .store(in: &cancellables)
    }
}
