import UIKit

public protocol FavOnboardingKitDelegate: AnyObject {
    func nextButtonTapped(atIndex index: Int)
    func getStartedButtonTapped()
}

public final class FavOnboardingKit {
    private let slides: [Slide]
    private let tintColor: UIColor
    public weak var delegate: FavOnboardingKitDelegate?
    
    private lazy var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController(slides: slides, tintColor: tintColor)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        controller.nextButtonTapped = { [weak self] index in
            self?.delegate?.nextButtonTapped(atIndex: index)
        }
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
