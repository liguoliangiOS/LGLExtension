//
//  UITextField+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

public extension LGL where Base : UITextField {
    
    //MARK: --- 给LGL扩充  设置UITextField及其子类 的属性
    
    /**
     - parameter textColor:        文字颜色
     - parameter font:             按钮字体
     - parameter placeholder:      提示文字
     - parameter borderStyle:      文本框类型
    */
    func set(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) {
        base.textColor = textColor
        base.font = font
        base.placeholder = placeholder
        base.borderStyle = borderStyle
    }
    
    /**
     设置提示文字的颜色和字体
     - parameter placeholderColor: 提示文字颜色
     - parameter placeholderFont:  提示文字字体
    */
    func setPlaceholder(_ placeholderColor: UIColor, _ placeholderFont: UIFont) {
        if #available(iOS 13.0, *) {
           let arrStr = NSMutableAttributedString(string: base.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor, NSAttributedString.Key.font: placeholderFont])
            base.attributedPlaceholder = arrStr
        } else {
            base.setValue(placeholderColor, forKeyPath: "_placeholderLabel.textColor")
            base.setValue(placeholderFont, forKeyPath:"_placeholderLabel.font")
        }
    }
    
    /**
     设置TextField的leftview
     - parameter leftView: 左边展示的view
    */
    func setLeftView(_ leftView: UIView) {
        base.leftView = leftView
        base.leftViewMode = .always
    }
    
    /**
     设置TextField的rightview
     - parameter rightView: 右展示的view
    */
    func setRightView(_ rightView: UIView) {
        base.rightView = rightView
        base.rightViewMode = .always
    }
    
    /**
     设置TextField的清楚按钮
     - parameter imageName: 替换清除按钮的图片名字
    */
    func setClearButton(_ imageName: String) {
        if let image = UIImage(named: imageName) {
            let cleaButton:UIButton =  base.value(forKey: "_clearButton") as! UIButton
            cleaButton.setImage(image, for: .normal)
            base.clearButtonMode = .whileEditing
        }
    }
    
    /**
     设置TextField的左边距
     - parameter padding: 左边距距离
    */
    func setLeftPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: base.frame.height))
        base.leftView = paddingView
        base.leftViewMode = .always
    }
    
    //MARK: --- 给LGL扩充  创建UITextField及其子类 的方法
    
    /**
     - parameter textColor:        文字颜色
     - parameter backgroundColor:  背景颜色
     - parameter font:             按钮字体
     - parameter placeholder:      提示文字
     - parameter borderStyle:      文本框类型
    */
    static func textField(_ textColor: UIColor, _ backgroundColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Base {
        let textField = Base()
        textField.textColor = textColor
        textField.font = font
        textField.placeholder = placeholder
        textField.borderStyle = borderStyle
        textField.backgroundColor = backgroundColor
        return textField
    }
    
    /**
     - parameter textColor:        文字颜色
     - parameter font:             按钮字体
     - parameter placeholder:      提示文字
     - parameter borderStyle:      文本框类型
    */
    static func textField(_ textColor: UIColor, _ font: UIFont, _ placeholder: String, _ borderStyle: UITextField.BorderStyle) -> Base {
        let textField = Base()
        textField.textColor = textColor
        textField.font = font
        textField.placeholder = placeholder
        textField.borderStyle = borderStyle
        return textField
    }
}
