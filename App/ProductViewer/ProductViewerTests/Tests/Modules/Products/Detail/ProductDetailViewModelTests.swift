import XCTest
import Combine
@testable import ProductViewer

final class ProductDetailViewModelTests: XCTestCase {
    // MARK: Properties
    var subject: ProductDetailViewModel!
    var mockRouter = MockRouter<ProductsRoute>()
    var mockProductService = MockProductService()
    
    var viewDidLoads: PassthroughSubject<Void, Never>!
    var outputs: ProductDetailViewModel.Outputs!
    
    // MARK: XCTestCase
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        subject = ProductDetailViewModel(
            router: mockRouter.weakRouter,
            productService: mockProductService,
            productID: 0
        )
        
        viewDidLoads = PassthroughSubject()
        
        outputs = subject.transform(inputs: ProductDetailViewModel.Inputs(
            viewDidLoads: viewDidLoads.eraseToAnyPublisher()
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
}
