//
//  UIBarButtonItem+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit


extension UIBarButtonItem: LGLCompatible {}

public extension LGL where Base : UIBarButtonItem {
    
    /**
     通过图片初始化
     - parameter image:         初始化的图片
     - parameter style:         类型
     - parameter target:        目标对象
     - parameter action:        点击事件方法名称
    */
    static func item(_ image: UIImage, _ style: UIBarButtonItem.Style = .plain, _ target: Any?, _ action: Selector?) -> UIBarButtonItem  {
        let originalImage = image.withRenderingMode(.alwaysOriginal)
        return UIBarButtonItem(image: originalImage, style: style, target: target, action: action)
    }
    
    /**
     通过标题初始化
     - parameter title:         初始化标题
     - parameter style:         类型
     - parameter target:        目标对象
     - parameter action:        点击事件方法名称
    */
    static func item(_ title: String, _ style: UIBarButtonItem.Style = .plain, _ target: Any?, _ action: Selector?) -> UIBarButtonItem  {
        return UIBarButtonItem(title: title, style: style, target: target, action: action)
    }
}
