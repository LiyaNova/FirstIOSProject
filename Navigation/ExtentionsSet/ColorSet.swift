//
//  ColorSet.swift
//  Navigation
//
//  Created by Юлия Филимонова on 17.04.2022.
//

import Foundation
import UIKit


//extension UIView {
//    func colorOfPoint(point: CGPoint) -> UIColor {
//        let colorSpace: CGColorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
//
//        var pixelData: [UInt8] = [0, 0, 0, 0]
//
//        let context = CGContext(data: &pixelData, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
//
//        context!.translateBy(x: -point.x, y: -point.y)
//
//        self.layer.render(in: context!)
//
//        let red: CGFloat = CGFloat(pixelData[0]) / CGFloat(255.0)
//        let green: CGFloat = CGFloat(pixelData[1]) / CGFloat(255.0)
//        let blue: CGFloat = CGFloat(pixelData[2]) / CGFloat(255.0)
//        let alpha: CGFloat = CGFloat(pixelData[3]) / CGFloat(255.0)
//
//        let color: UIColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
//
//        return color
//    }
//}

//extension UIColor {
//
//   //var color1 = hexStringToUIColor("#d3d3d3")
//
//    func hexStringToUIColor (hex:String) -> UIColor {
//        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//
//        if (cString.hasPrefix("#")) {
//            cString.remove(at: cString.startIndex)
//        }
//
//        if ((cString.count) != 6) {
//            return UIColor.gray
//        }
//
//        var rgbValue:UInt64 = 0
//        Scanner(string: cString).scanHexInt64(&rgbValue)
//
//        return UIColor(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: CGFloat(1.0)
//        )
//
//    }
//}
