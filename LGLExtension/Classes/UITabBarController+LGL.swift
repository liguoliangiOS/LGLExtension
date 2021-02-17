//
//  UITabBarController+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit


extension UITabBarController: LGLCompatible {}

public extension LGL where Base == UITabBarController {
    
    ///设置tabBar颜色
    func setTabBar(color: UIColor) {
        base.tabBar.isTranslucent = false
        base.tabBar.barTintColor = color
        base.tabBar.shadowImage = UIImage()
        base.tabBar.backgroundImage = UIImage()
    }
    
    ///设置tabBar阴影
    func setTabBarShadow(_ bgColor: UIColor, _ shadowColor: UIColor, _ shadowOffset: CGSize, _ shadowRadius:CGFloat, _ shadowOpacity: Float = 1.0)  {
        setTabBar(color: bgColor)
        base.tabBar.layer.shadowColor = shadowColor.cgColor
        base.tabBar.layer.shadowOffset = shadowOffset
        base.tabBar.layer.shadowOpacity = shadowOpacity
        base.tabBar.layer.shadowRadius = shadowRadius
    }
}
