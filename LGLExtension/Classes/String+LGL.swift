//
//  String+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/18.
//

import UIKit


extension String: LGLCompatible {}

public extension LGL where Base == String {
    
    /**
     判断某一个字符串是否匹配某一个正则，用于输入结束后整体的判定
     - parameter pattern:   正则表达式字符串
     - parameter ignoreCase:  是否区分大小写
    */
    func isMatch( _ pattern: String,  _ ignoreCase: Bool) -> Bool {
        return NSRegularExpression.lgl.isMatch(string: base, pattern: pattern, ignoreCase: ignoreCase)
    }
    
    /**
     判断某一个字符是否匹配某一个正则，用于判断单个字符输入结束后判定
     - parameter characterStr:  输入的单个字符
     - parameter judgeText:  正则表达式字符串
    */
    func isCharacterSetWithStr(_ characterStr: String, _ judgeText: String) -> Bool {
          let characterSet = NSCharacterSet(charactersIn: characterStr).inverted
          let filterArr:[String] = judgeText.components(separatedBy: characterSet)
          let filterstr:String = filterArr.joined(separator: "")
          let result:Bool = judgeText == filterstr
          if result {
              return true
          }
          return false
    }
    
    /**
     获取某一段字符串的CGSize
     - parameter font:   字符串的字体
     - parameter maxWidth:  展示字符的最大宽度
    */
    func getStrSize(_ font: UIFont, _ maxWidth: CGFloat) -> CGSize {
        let attrs = [NSAttributedString.Key.font: font]
        let showText = base as NSString
        let textRect:CGRect = showText.boundingRect(with: CGSize(width: maxWidth, height: CGFloat(MAXFLOAT)), options:[.usesLineFragmentOrigin, .truncatesLastVisibleLine, .usesFontLeading], attributes: attrs, context: nil)
        return textRect.size
    }
    
    /**
     获取设置行高以后的字符串的CGSize
     - parameter lineHeight:  行高
     - parameter font:        字体大小
     - parameter maxW:        展示字符的最大宽度
    */
    func getLineHeightWithSize(_ lineHeight: CGFloat, _ font: UIFont, _ maxW: CGFloat) -> CGSize {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        let text = base as NSString
        let textRect = text.boundingRect(with: CGSize(width: maxW, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font, NSAttributedString.Key.paragraphStyle:paragraphStyle ], context: nil)
        return textRect.size
    }
    
    /**
     修改指定字符串的字体和颜色
     - parameter changeText:  要修改的字符串
     - parameter changeColor: 要修展示颜色
     - parameter changeFont:  要修展示的字体
    */
    func setRangeText(_ changeText: String, _ changeColor: UIColor, _ changeFont: UIFont) -> NSAttributedString  {
        let attributStr = NSMutableAttributedString(string: base)
        let textStr = base as NSString
        let range = textStr.range(of: changeText)
        attributStr.addAttribute(NSAttributedString.Key.font, value: changeFont, range: range)
        attributStr.addAttribute(NSAttributedString.Key.foregroundColor, value: changeColor, range: range)
        return attributStr
    }
    
    /**
     设置字符串行间距
     - parameter lineHeight: 行高
     - parameter alignment: 文字的对齐方式
    */
    func setLineHeight(_ lineHeight: CGFloat, _ alignment:   NSTextAlignment) -> NSAttributedString {
        let attributStr = NSMutableAttributedString(string: base)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        paragraphStyle.alignment = alignment;//文本对齐方式
        attributStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: base.count))
        return attributStr
    }
    
    /**
     设置指定范围内文字的颜色
     - parameter range: 设置文字范围
     - parameter changeColor: 文字颜色
    */
    func setRangeTextColor(_ range: NSRange, _ changeColor: UIColor) -> NSAttributedString {
        let attributStr = NSMutableAttributedString(string: base)
        attributStr.addAttribute(NSAttributedString.Key.foregroundColor, value: changeColor, range: range)
        return attributStr
    }
}
