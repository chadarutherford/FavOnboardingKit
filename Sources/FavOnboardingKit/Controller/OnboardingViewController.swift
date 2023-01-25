//
//  OnboardingViewController.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import UIKit

final class OnboardingViewController: UIViewController {
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
            return OnboardingViewController()
        }
    }
}
#endif
