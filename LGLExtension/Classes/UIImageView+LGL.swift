//
//  UIImageView+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

public extension LGL where Base == UIImageView {
    
    //MARK: --- 设置UIImageView的属性
    
    /**
     - parameter imageName:        图片名字
    */
    func set(_ imageName:String?) {
        if let imgN = imageName, let image = UIImage(named: imgN) {
            base.image = image
        }
    }
    
    /**
     - parameter imageName:        图片名字
     - parameter cornerRadius:     imagView圆角大小
    */
    func set(_ imageName:String?, _ cornerRadius:CGFloat) {
        set(imageName)
        base.layer.masksToBounds = true
        base.layer.cornerRadius = cornerRadius
    }
    
    /**
     - parameter imageName:        图片名字
     - parameter backgroundColor:  imagView背景颜色
     - parameter cornerRadius:     imagView圆角大小
    */
    func set(_ imageName:String?, _ backgroundColor: UIColor, _ cornerRadius:CGFloat) {
        set(imageName, cornerRadius)
        base.backgroundColor = backgroundColor
    }
    
    
    //MARK: --- 创建UIImageView实例对象
    
    /**
     - parameter imageName:        图片名字
     - returns:                    返回创建的UIImageView实例
    */
    static func imagView(_ imageName:String?) -> Base {
        let imageView = Base()
        if let imgN = imageName, let image = UIImage(named: imgN) {
            imageView.image = image
        }
        return imageView
    }
    
    /**
     - parameter imageName:        图片名字
     - parameter cornerRadius:     imagView圆角大小
     - returns:                    返回创建的UIImageView实例
    */
    static func imagView(_ imageName:String?, _ cornerRadius:CGFloat) -> Base {
        let imageView = imagView(imageName)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        return imageView
    }
    
    /**
     - parameter imageName:        图片名字
     - parameter backgroundColor:  imagView背景颜色
     - parameter cornerRadius:     imagView圆角大小
     - returns:                    返回创建的UIImageView实例
    */
    static func imagView(_ imageName:String?, _ backgroundColor: UIColor, _ cornerRadius:CGFloat) -> Base {
        let imageView = imagView(imageName, cornerRadius)
        imageView.backgroundColor = backgroundColor
        return imageView
    }
}
