import Foundation
import SimpleApiClient

final class TargetApiClient: HttpClient {
    // MARK: Init
    init() {
        guard let url = URL(string: "https://api.target.com/mobile_case_study_deals/v1/") else {
            fatalError("Api Client base URL was invalid.")
        }
        super.init(baseUrl: url)
    }
}
