//
//  AnimatedBarView.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import UIKit

final class AnimatedBarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .systemPurple
    }
}
