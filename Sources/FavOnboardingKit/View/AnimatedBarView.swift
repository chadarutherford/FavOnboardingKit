//
//  AnimatedBarView.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import Combine
import SnapKit
import UIKit

enum State {
    case clear
    case animating
    case filled
}

final class AnimatedBarView: UIView {
    private lazy var backgroundBarView: UIView = {
        let view = UIView()
        view.backgroundColor = viewTintColor.withAlphaComponent(0.2)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var foregroundBarView: UIView = {
        let view = UIView()
        view.backgroundColor = viewTintColor
        view.alpha = 0
        return view
    }()
    
    @Published private var state: State = .clear
    private var subscribers: Set<AnyCancellable> = .init()
    private var animator: UIViewPropertyAnimator!
    private let viewTintColor: UIColor
    
    init(tintColor: UIColor) {
        self.viewTintColor = tintColor
        super.init(frame: .zero)
        setupAnimator()
        layout()
        observe()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAnimator() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .easeInOut) {
            self.foregroundBarView.transform = .identity
        }
    }
    
    private func observe() {
        $state.sink { [unowned self] state in
            switch state {
            case .clear:
                setupAnimator()
                foregroundBarView.alpha = 0
                animator.stopAnimation(false)
            case .animating:
                foregroundBarView.transform = .init(scaleX: 0, y: 1.0)
                foregroundBarView.transform = .init(translationX: -frame.size.width, y: 0)
                foregroundBarView.alpha = 1
                animator.startAnimation()
            case .filled:
                animator.stopAnimation(true)
                foregroundBarView.transform = .identity
            }
        }.store(in: &subscribers)
    }
    
    private func layout() {
        addSubview(backgroundBarView)
        backgroundBarView.addSubview(foregroundBarView)
        
        backgroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        foregroundBarView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundBarView)
        }
    }
    
    func startAnimating() {
        state = .animating
    }
    
    func reset() {
        state = .clear
    }
    
    func complete() {
        state = .filled
    }
}
