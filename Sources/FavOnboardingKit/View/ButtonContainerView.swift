//
//  ButtonContainerView.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import SnapKit
import UIKit

final class ButtonContainerView: UIView {
    private var buttonTintColor: UIColor
    var nextButtonTapped: () -> Void = {}
    var getStartedButtonTapped: () -> Void = {}
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(buttonTintColor, for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 16)
        button.layer.borderColor = buttonTintColor.cgColor
        button.layer.borderWidth = 2
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(nextSlide), for: .touchUpInside)
        return button
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 16)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 12
        button.backgroundColor = buttonTintColor
        button.layer.shadowColor = buttonTintColor.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 8
        button.addTarget(self, action: #selector(getStarted), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nextButton,
            getStartedButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 24
        return stackView
    }()
    
    init(buttonTintColor: UIColor) {
        self.buttonTintColor = buttonTintColor
        super.init(frame: .zero)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 24, left: 24, bottom: 36, right: 24))
        }
        
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(getStartedButton.snp.width).multipliedBy(0.5)
        }
    }
    
    @objc
    private func nextSlide() {
        nextButtonTapped()
    }
    
    @objc
    private func getStarted() {
        getStartedButtonTapped()
    }
}
