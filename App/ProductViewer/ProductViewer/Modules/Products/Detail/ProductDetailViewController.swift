import UIKit
import Combine

final class ProductDetailViewController: NiblessUIViewController {
    // MARK: Properties
    private let viewModel: ProductDetailViewModel
    private lazy var contentView = ProductDetailView()
    
    private let viewDidLoads = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Init
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        
        super.init()
    }
    
    // MARK: UIViewController
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Detail", comment: "The navbar title of the product detail screen.")
        
        setUpBindings()
        
        viewDidLoads.send()
    }
}

private extension ProductDetailViewController {
    func setUpBindings() {
        let outputs = viewModel.transform(inputs: ProductDetailViewModel.Inputs(
            viewDidLoads: viewDidLoads.eraseToAnyPublisher()
        ))
        
        outputs.product
            .sink { [weak self] product in
                self?.contentView.configure(model: product)
            }
            .store(in: &cancellables)
    }
}
