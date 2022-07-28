import UIKit

final class PVNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImage(named: "back-arrow")!
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        
        let barAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [PVNavigationController.self])
        barAppearance.standardAppearance = navBarAppearance
        barAppearance.compactAppearance = navBarAppearance
        barAppearance.scrollEdgeAppearance = navBarAppearance
        barAppearance.tintColor = .assetColor(.targetRed500)
        barAppearance.isTranslucent = false
        barAppearance.barTintColor = .systemBackground

        delegate = self
    }
   
}


// MARK: - UINavigationControllerDelegate

extension PVNavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: nil,
            style: .plain,
            target: nil,
            action: nil
        )
    }
}
