import XCTest
import Combine
@testable import ProductViewer

final class ProductListViewModelTests: XCTestCase {
    // MARK: Properties
    var subject: ProductListViewModel!
    var mockRouter = MockRouter<ProductsRoute>()
    var mockProductService = MockProductService()
    
    var viewDidLoads: PassthroughSubject<Void, Never>!
    var listRefreshes: PassthroughSubject<Void, Never>!
    var itemSelections: PassthroughSubject<IndexPath, Never>!
    var outputs: ProductListViewModel.Outputs!
    
    // MARK: XCTestCase
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        subject = ProductListViewModel(
            router: mockRouter.weakRouter,
            productService: mockProductService
        )
        
        viewDidLoads = PassthroughSubject()
        listRefreshes = PassthroughSubject()
        itemSelections = PassthroughSubject()
        
        outputs = subject.transform(inputs: ProductListViewModel.Inputs(
            viewDidLoads: viewDidLoads.eraseToAnyPublisher(),
            listRefreshes: listRefreshes.eraseToAnyPublisher(),
            itemSelections: itemSelections.eraseToAnyPublisher()
        ))
    }

    override func tearDownWithError() throws {
        
    }

    // MARK: Tests
    func testIsLoading() {
        // TODO
    }
    
    func testlistData() {
        // TODO
    }
    
    func testErrorToDisplay() {
        // TODO
    }
    
    func testTriggerDetailScreen() {
        // TODO
    }
}
