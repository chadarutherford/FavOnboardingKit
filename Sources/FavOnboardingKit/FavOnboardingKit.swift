import UIKit

public protocol FavOnboardingKitDelegate: AnyObject {
    func nextButtonTapped(atIndex index: Int)
    func getStartedButtonTapped()
}

public final class FavOnboardingKit {
    private let slides: [Slide]
    private let tintColor: UIColor
    private var rootVC: UIViewController?
    public weak var delegate: FavOnboardingKitDelegate?
    
    private lazy var onboardingViewController: OnboardingViewController = {
        let controller = OnboardingViewController(slides: slides, tintColor: tintColor)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .fullScreen
        controller.nextButtonTapped = { [weak self] index in
            self?.delegate?.nextButtonTapped(atIndex: index)
        }
        controller.getStartedButtonTapped = { 
            self.delegate?.getStartedButtonTapped()
        }
        return controller
    }()
    
    public init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
    }
    
    public func launchOnboarding(rootVC: UIViewController) {
        self.rootVC = rootVC
        rootVC.showDetailViewController(onboardingViewController, sender: self)
    }
    
    public func dismissOnboarding() {
        if rootVC?.presentedViewController == onboardingViewController {
            onboardingViewController.dismiss(animated: true)
        }
    }
}
