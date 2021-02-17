//
//  UIButton+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

public extension LGL where Base == UIButton {
    
    //MARK: --- 设置UIButton的属性
    /**
     - parameter target:        按钮target
     - parameter action:        按钮点击方法
     - parameter event:         按钮状态
    */
    func addTarget(_ target:Any, _ action:Selector, _ event:UIControl.Event = .touchUpInside) {
        base.addTarget(target, action: action, for: event)
    }
    
    /**
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    func set(_ titleColor:UIColor, _ font:UIFont, _ state: UIControl.State = .normal) {
        base.setTitleColor(titleColor, for: state)
        base.titleLabel?.font = font
    }
    
    /**
     - parameter title:            按钮文字
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    func setTitle(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ state: UIControl.State = .normal) {
        base.setTitle(title, for: state)
        base.setTitleColor(titleColor, for: state)
        base.titleLabel?.font = font
    }
    
    /**
     - parameter title:            按钮文字
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter imageName:        图片名字-字符串
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    func setTitleWithImage(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ imageName:String?, _ state: UIControl.State = .normal) {
        setTitle(title, titleColor, font, state)
        setImage(imageName, state)
    }
    
    /**
     - parameter title:            按钮文字
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter backgroundImageName:  背景图片名字-字符串
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    func setTitleWithBackgroundImage(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ backgroundImageName:String?, _ state: UIControl.State = .normal) {
        setTitle(title, titleColor, font, state)
        setBackgroundImage(backgroundImageName, state)
    }
    
    /**
     - parameter imageName:        图片名字-字符串
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    func setImage(_ imageName:String?, _ state: UIControl.State = .normal) {
        guard let imageN = imageName, let image = UIImage(named: imageN) else { return }
        base.setImage(image, for: state)
    }
    
    /**
     - parameter backgroundImage:  背景图片名字-字符串
     - parameter state:            背景图片显示的按钮状态 默认normal状态
    */
    func setBackgroundImage(_ backgroundImage:String?, _ state: UIControl.State = .normal) {
        guard let imageN = backgroundImage, let image = UIImage(named: imageN) else { return }
        base.setBackgroundImage(image, for: state)
    }
    
    
    //MARK: --- 创建UIButton实例对象
    
    /**
     - parameter type:             按钮类型
     - parameter title:            按钮文字
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    static func button(_ type:UIButton.ButtonType,  _ title:String, _ titleColor:UIColor, _ font:UIFont, _ state: UIControl.State = .normal) -> Base {
        let button = Base(type: type)
        button.lgl.setTitle(title, titleColor, font, state)
        button.titleLabel?.font = font
        return button
    }
    
    /**
     通过背景图片初始化
     - parameter type:             按钮类型
     - parameter backgroundImageName: 按钮图片
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    static func buttonBackgroundImage(_ type:UIButton.ButtonType, _ backgroundImageName:String, _ state: UIControl.State = .normal) -> Base {
        let button = Base(type: type)
        button.lgl.setBackgroundImage(backgroundImageName, state)
        return button
    }
    
    /**
     通过图片初始化
     - parameter type:             按钮类型
     - parameter imageName:        按钮图片
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    static func buttonImage(_ type:UIButton.ButtonType, _ imageName:String, _ state: UIControl.State = .normal) -> Base {
        let button = Base(type: type)
        button.lgl.setImage(imageName, state)
        return button
    }
    
    /**
     创建自定义类型的按钮
     - parameter title:            按钮文字
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    static func button(_ title:String, _ titleColor:UIColor, _ font:UIFont, _ state: UIControl.State = .normal) -> Base {
        return Base.lgl.button(.custom, title, titleColor, font, state)
    }
    
    /**
     创建自定义类型的按钮
     - parameter title:            按钮文字
     - parameter titleColor:       按钮文字颜色
     - parameter font:             按钮字体
     - parameter state:            图片显示的按钮状态 默认normal状态
    */
    static func button(_ titleColor:UIColor, _ font:UIFont, _ state: UIControl.State = .normal) -> Base {
        let button = Base(type: .custom)
        button.lgl.set(titleColor, font, state)
        return button
    }
}
