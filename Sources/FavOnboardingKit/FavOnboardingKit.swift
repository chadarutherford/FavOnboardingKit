import UIKit

public final class FavOnboardingKit {
    private var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController()
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()
    
    public init() {
        
    }
    
    public func launchOnboarding(rootVC: UIViewController) {
        rootVC.showDetailViewController(onboardingViewController, sender: self)
    }
    
    public func dismissOnboarding() {
        
    }
}
