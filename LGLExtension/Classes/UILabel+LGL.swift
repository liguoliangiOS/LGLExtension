//
//  UILabel+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

///扩充便捷设置设置label的属性的方法
public extension LGL where Base == UILabel {
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter backgroundColor:   label的背景颜色
    */
    func set(_ text: String, _ textColor: UIColor, _ font: UIFont, _ backgroundColor: UIColor = .clear)  {
        set(text, textColor, font, .left, 1, backgroundColor)
    }
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter textAlignment:     label的文字对其方式
     - parameter backgroundColor:   label的背景颜色
    */
    func set(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ backgroundColor: UIColor = .clear)  {
        set(text, textColor, font, textAlignment, 1, backgroundColor)
    }
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter numberOfLines:     label的行数
     - parameter backgroundColor:   label的背景颜色
    */
    func set(_ text: String, _ textColor: UIColor, _ font: UIFont,  _ numberOfLines: Int, _ backgroundColor: UIColor = .clear)  {
        set(text, textColor, font, .left, numberOfLines, backgroundColor)
    }
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter textAlignment:     label的文字对其方式
     - parameter numberOfLines:     label的行数
     - parameter backgroundColor:   label的背景颜色
    */
    func set(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment,  _ numberOfLines: Int, _ backgroundColor: UIColor)  {
        base.text = text
        base.textColor = textColor
        base.font = font
        base.textAlignment = textAlignment
        base.numberOfLines = numberOfLines
        base.backgroundColor = backgroundColor
    }
    
    //MARK: ----创建实例---
    
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter backgroundColor:   label的背景颜色
     - returns:                     返回创建的UILabel实例
    */
    static func label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ backgroundColor: UIColor = .clear) -> Base  {
        label(text, textColor, font, .left, 1, backgroundColor)
    }
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter textAlignment:     label的文字对其方式
     - parameter backgroundColor:   label的背景颜色
     - returns:                     返回创建的UILabel实例
    */
    static func label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment, _ backgroundColor: UIColor = .clear) -> Base  {
        label(text, textColor, font, textAlignment, 1, backgroundColor)
    }
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter numberOfLines:     label的行数
     - parameter backgroundColor:   label的背景颜色
     - returns:                     返回创建的UILabel实例
    */
    static func label(_ text: String, _ textColor: UIColor, _ font: UIFont,  _ numberOfLines: Int, _ backgroundColor: UIColor = .clear) -> Base  {
        label(text, textColor, font, .left, numberOfLines, backgroundColor)
    }
    /**
     - parameter text:              label的文字
     - parameter textColor:         label的字体颜色
     - parameter font:              label的字体
     - parameter textAlignment:     label的文字对其方式
     - parameter numberOfLines:     label的行数
     - parameter backgroundColor:   label的背景颜色
     - returns:                     返回创建的UILabel实例
    */
    static func label(_ text: String, _ textColor: UIColor, _ font: UIFont, _ textAlignment: NSTextAlignment,  _ numberOfLines: Int, _ backgroundColor: UIColor = .clear) -> Base  {
        let label = Base()
        label.lgl.set(text, textColor, font, textAlignment, numberOfLines, backgroundColor)
        return label
    }
}
