//
//  UIColor+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

extension UIColor: LGLCompatible {}

public extension LGL where Base == UIColor {
    /**
     创建一个适配暗黑模式的颜色
     - parameter darkColor:   暗黑模式的时候展示的颜色
     - parameter lightColor:  其他模式的时候展示的颜色
    */
    static func traitColor(_ darkColor:UIColor, _ lightColor:UIColor) -> UIColor {
       if #available(iOS 13.0, *) {
           let color = UIColor{ (traitCollection) -> UIColor in
               if traitCollection.userInterfaceStyle == .dark {
                   return darkColor
               } else {
                   return lightColor
               }
           }
           return color
       } else {
           return lightColor
       }
    }
    
    /**
     获取一个随机色
    */
    static func randomColor() -> UIColor {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    /**
     定义UInt颜色
     - parameter hex: 16进制值颜色字符串
    */
    static func color(_ hex: UInt, _ alpha: CGFloat = 1.0) -> UIColor {
        return Base(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                    green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                    blue: CGFloat(hex & 0x0000FF) / 255.0,
                    alpha: alpha)
    }
    
    /**
     定义16进制字符串值颜色
     - parameter hex: 16进制值颜色字符串
    */
    static func color(_ hex: String, _ alpha: CGFloat = 1.0) -> UIColor {
        var cstr = hex.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length < 6){
            return UIColor.clear;
        }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from: 2) as NSString
        }
        if(cstr.hasPrefix("#")){
            cstr = cstr.substring(from: 1) as NSString
        }
        if(cstr.length != 6){
            return UIColor.clear;
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cstr as String).scanHexInt64(&rgbValue)
        
        return Base(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                         green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                         blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                         alpha: alpha);
    }
}
