import UIKit

public final class FavOnboardingKit {
    private let slides: [Slide]
    private let tintColor: UIColor
    
    private lazy var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController(slides: slides, tintColor: tintColor)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        return controller
    }()
    
    public init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
    }
    
    public func launchOnboarding(rootVC: UIViewController) {
        rootVC.showDetailViewController(onboardingViewController, sender: self)
    }
    
    public func dismissOnboarding() {
        
    }
}
