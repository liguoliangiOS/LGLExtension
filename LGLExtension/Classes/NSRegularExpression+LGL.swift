//
//  NSRegularExpression+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/18.
//

import UIKit

extension NSRegularExpression: LGLCompatible {}

public extension LGL where Base == NSRegularExpression {
    /**
     扩展匹配的方法
     - parameter string:   要匹配的字符串
     - parameter pattern:  要匹配正则
     - parameter ignoreCase:  是否区分大小写
    */
    static func isMatch(string: String, pattern: String, ignoreCase: Bool) -> Bool {
        var isMatch = false
        do {
            // 正则匹配选项
            let options: NSRegularExpression.Options = ignoreCase ? [NSRegularExpression.Options.caseInsensitive] : []
            let regular = try NSRegularExpression(pattern: pattern, options: options)
            let range = NSRange(location: 0, length: string.count)
            let numbers = regular.numberOfMatches(in: string, options: [], range: range)
            isMatch = numbers > 0 ? true : false
        } catch {
            isMatch = false
            print(error)
        }
        return isMatch
    }
    
    /**
     扩展替换方法
     - parameter string:   要被替换的字符串
     - parameter pattern:  替换的字符串
     - parameter ignoreCase:  替换规则
    */
    static func replacement(string: String, replace: String, pattern: String) -> String {
        var value = string
        do {
            let regular = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(location: 0, length: string.count)
            value = regular.stringByReplacingMatches(in: string, options: [], range: range, withTemplate: replace)
        } catch {
            print(error)
        }
        return value
    }
}
