//
//  File.swift
//  
//
//  Created by Chad Rutherford on 1/25/23.
//

import UIKit

extension UIImage {
    static let slide1 = image(at: "imSlide1")
    static let slide2 = image(at: "imSlide1")
    static let slide3 = image(at: "imSlide1")
    static let slide4 = image(at: "imSlide1")
    static let slide5 = image(at: "imSlide1")
    
    static func image(at filePath: String) -> UIImage {
        let path = Bundle.main.path(forResource: filePath, ofType: "jpeg") ?? ""
        return UIImage(contentsOfFile: path) ?? UIImage()
    }
}
