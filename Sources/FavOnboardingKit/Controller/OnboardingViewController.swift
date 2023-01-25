//
//  OnboardingViewController.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private let slides: [Slide]
    private let tintColor: UIColor
    
    init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.tintColor = tintColor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

#if canImport(SwiftUI)
import SwiftUI
struct OnboardingViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: OnboardingViewControllerPreviews.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<OnboardingViewControllerPreviews.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<OnboardingViewControllerPreviews.ContainerView>) -> UIViewController {
            let slides : [Slide] = [
                .init(image: UIImage.slide1, title: "Personalized offers at 40,000+ places"),
                .init(image: UIImage.slide1, title: "Stack your rewards every time you pay"),
                .init(image: UIImage.slide1, title: "Enjoy now, FavePay Later"),
                .init(image: UIImage.slide1, title: "Earn cashback with your physical card"),
                .init(image: UIImage.slide1, title: "Save and earn cashback with Deals or eCards")

            ]
            return OnboardingViewController(slides: slides,
                                            tintColor: UIColor(red: 220 / 255, green: 20 / 255, blue: 60 / 255, alpha: 1))
        }
    }
}
#endif
