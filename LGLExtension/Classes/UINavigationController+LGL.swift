//
//  UINavigationController+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit


extension UINavigationController: LGLCompatible {}

public extension LGL where Base == UINavigationController {
    /**
     设置导航栏标题的字体颜色和大小
     - parameter color:        导航栏字体颜色
     - parameter font:         导航栏字体大小
    */
    func setTitle(_ color:UIColor, _ font: UIFont)  {
         base.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font]
    }
    
    ///设置导航栏透明
    func setNavigationClear()  {
        base.navigationBar.setBackgroundImage(UIImage(), for: .default)
        base.navigationBar.shadowImage = UIImage()
    }
    
    ///设置还原导航默认
    func setNavigationDefault()  {
        base.navigationBar.setBackgroundImage(nil, for: .default)
        base.navigationBar.shadowImage = nil
    }
}
