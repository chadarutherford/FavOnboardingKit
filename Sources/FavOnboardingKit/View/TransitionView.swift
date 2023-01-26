//
//  TransitionView.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import SnapKit
import UIKit

final class TransitionView: UIView {
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.backgroundColor = .systemMint
        return view
    }()
    
    private lazy var barViews: [AnimatedBarView] = {
        var views = [AnimatedBarView]()
        slides.forEach { _ in
            let view = AnimatedBarView()
            views.append(view)
        }
        return views
    }()
    
    private lazy var barStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: barViews)
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var titleView: TitleView = {
        let view = TitleView()
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            imageView,
            titleView
        ])
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private let slides: [Slide]
    private let viewTintColor: UIColor
    
    init(slides: [Slide], tintColor: UIColor) {
        self.slides = slides
        self.viewTintColor = tintColor
        super.init(frame: .zero)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(stackView)
        addSubview(barStackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        barStackView.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(24)
            make.trailing.equalTo(snp.trailing).offset(-24)
            make.top.equalTo(snp.topMargin)
            make.height.equalTo(4)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(stackView.snp.height).multipliedBy(0.8)
        }
    }
}
