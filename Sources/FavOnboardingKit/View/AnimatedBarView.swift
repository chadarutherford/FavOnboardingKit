//
//  AnimatedBarView.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import SnapKit
import UIKit

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
    
    private let viewTintColor: UIColor
    
    init(tintColor: UIColor) {
        self.viewTintColor = tintColor
        super.init(frame: .zero)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
}
