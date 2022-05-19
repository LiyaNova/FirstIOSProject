//
//  UIImageExtension.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.05.2022.
//

import UIKit

extension UIImage {

    func setAlpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let image  = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
