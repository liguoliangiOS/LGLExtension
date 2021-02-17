//
//  UIView+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

///遵循LGLCompatible让UIView和UIView的子类拥有LGL实例和LGL.self
extension UIView: LGLCompatible {}

//MARK: --- UIView扩充设置属性方法
public extension LGL where Base == UIView {
    /**
     - parameter backgroundColor:  UIView的背景颜色
    */
    func set(_ backgroundColor: UIColor) {
        base.backgroundColor = backgroundColor
    }
    /**
     - parameter backgroundColor:  UIView的背景颜色
     - parameter cornerRadius:     圆角大小
    */
    func set(_ backgroundColor: UIColor, _ cornerRadius: CGFloat = 0) {
        base.backgroundColor = backgroundColor
        base.layer.masksToBounds = true
        base.layer.cornerRadius = cornerRadius
    }
    
    /**
     - parameter cornerRadius:     圆角大小
    */
    func set(_ cornerRadius: CGFloat) {
        base.layer.masksToBounds = true
        base.layer.cornerRadius = cornerRadius
    }
    
    //MARK: --- 创建UIView实例对象
    
    /**
     - parameter backgroundColor:  UIView的背景颜色
     - returns:                    返回创建的UIView实例
    */
    static func view(_ backgroundColor: UIColor) -> Base {
       let view = Base()
        view.backgroundColor = backgroundColor
        return view
    }
    
    /**
     - parameter cornerRadius:     圆角大小
     - returns:                    返回创建的UIView实例
    */
    static func view(_ cornerRadius: CGFloat = 0) -> Base {
        let view = Base()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    /**
     - parameter backgroundColor:  UIView的背景颜色
     - parameter cornerRadius:     圆角大小
     - returns:                    返回创建的UIView实例
    */
    static func view(_ backgroundColor: UIColor, _ cornerRadius: CGFloat = 0) -> Base {
       let view = Base()
        view.backgroundColor = backgroundColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    //MARK: -获取当前View的控制器
    func currentVC() -> UIViewController? {
        var nextResponder: UIResponder? = base
        repeat {
            nextResponder = nextResponder?.next
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
        } while nextResponder != nil
        return nil
    }
    
    //MARK: -View转图片
    func viewToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(base.bounds.size, false, UIScreen.main.scale)
        base.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //MARK: -截图
    func screenshotImage() -> UIImage? {
        UIGraphicsBeginImageContext(base.bounds.size)
        if base.responds(to: #selector(UIView.drawHierarchy(in:afterScreenUpdates:))) {
            base.drawHierarchy(in: base.bounds, afterScreenUpdates: false)
        } else if base.layer.responds(to: #selector(CALayer.render(in:) )) {
            base.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else {
            return nil
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

//MARK: --- UIView和它的子类扩充公共方法
public extension LGL where Base : UIView {
    
    //MARK: --- 设置、获取UIView的frame
    var height:CGFloat {
        get { base.frame.height }
        set(newValue) {
            var tempFrame = base.frame
            tempFrame.size.height = newValue
            base.frame = tempFrame
        }
    }
    
    var width:CGFloat {
        get { base.frame.width }
        set(newValue) {
            var tempFrame = base.frame
            tempFrame.size.width = newValue
            base.frame = tempFrame
        }
    }
    
    var x:CGFloat {
        get { base.frame.origin.x }
        set(newValue) {
            var tempFrame = base.frame
            tempFrame.origin.x = newValue
            base.frame = tempFrame
        }
    }
    
    var centerX:CGFloat {
        get { base.center.x }
        set(newValue) {
            var tempCenter = base.center
            tempCenter.x = newValue
            base.center = tempCenter
        }
    }
    
    var centerY:CGFloat {
        get { base.center.y }
        set(newValue) {
            var tempCenter = base.center
            tempCenter.y = newValue
            base.center = tempCenter
        }
    }
    
    var y:CGFloat {
        get { base.frame.origin.y }
        set(newValue) {
            var tempFrame = base.frame
            tempFrame.origin.y = newValue
            base.frame = tempFrame
        }
    }
    
    /// left值
    var left: CGFloat {
        get { base.frame.origin.x }
        set {
            var tempFrame = base.frame
            tempFrame.origin.x = newValue
            base.frame = tempFrame
        }
    }
    
    /// top值
    var top: CGFloat {
        get { base.frame.origin.y }
        set {
            var tempFrame = base.frame
            tempFrame.origin.y = newValue
            base.frame = tempFrame
        }
    }
    
    /// right值
    var right: CGFloat {
        get { base.frame.origin.x + base.frame.size.width }
        set {
            var tempFrame = base.frame
            tempFrame.origin.x = newValue - base.frame.size.width
            base.frame = tempFrame
        }
    }
    
    /// bottom值
    var bottom: CGFloat {
        get { base.frame.origin.y + base.frame.size.height }
        set {
            var tempFrame = base.frame
            tempFrame.origin.y = newValue - base.frame.size.height
            base.frame = tempFrame
        }
    }
    
    /// size值
    var size: CGSize {
        get { base.frame.size }
        set {
            var tempFrame = base.frame
            tempFrame.size = newValue
            base.frame = tempFrame
        }
    }
    
    /// origin值
    var origin: CGPoint {
        get { base.frame.origin }
        set {
            var tempFrame = base.frame
            tempFrame.origin = newValue
            base.frame = tempFrame
        }
    }
    
    //MARK: -设置圆角和边框
    /**
     设置圆角
     - parameter corners:        设置圆角的位置
     - parameter cornerRadius:   圆角大小
    */
    func radius(_ corners: UIRectCorner,_ cornerRadius: CGFloat) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = base.bounds
        shapeLayer.path = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)).cgPath
        base.layer.mask = shapeLayer
    }
    
    /**
     设置边框
     - parameter borderColor:    边框颜色
     - parameter borderWidth:    边框大小
    */
    func border(_ borderColor:UIColor, _ borderWidth: CGFloat)  {
        base.layer.borderColor = borderColor.cgColor
        base.layer.borderWidth = borderWidth
    }
    
    /**
     设置圆角和边框
     - parameter cornerRadius:   圆角大小
     - parameter masksToBounds:  是否切圆角
     - parameter borderColor:    边框颜色
     - parameter borderWidth:    边框大小
    */
    func borderRadius(_ cornerRadius: CGFloat, _ masksToBounds: Bool, _ borderColor:UIColor, _ borderWidth: CGFloat)  {
        base.layer.masksToBounds = masksToBounds
        base.layer.cornerRadius = cornerRadius
        base.layer.borderColor = borderColor.cgColor
        base.layer.borderWidth = borderWidth
    }
    
    //MARK: -设置渐变色
    
    /**
     设置水平渐变
     - parameter startColor:    开始颜色
     - parameter endColor:      结束颜色
     - parameter cornerRadius:  圆角大小
    */
    func horizontalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat) {
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 1, y: 0)
        gradientLayer(startColor, startPoint, endColor, endPoint, cornerRadius)
    }
    
    /**
     设置垂直渐变
     - parameter startColor:    开始颜色
     - parameter endColor:      结束颜色
     - parameter cornerRadius:  圆角大小
    */
    func verticalGradientLayer(_ startColor: UIColor, _ endColor: UIColor, _ cornerRadius:CGFloat) {
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: 0, y: 1)
        gradientLayer(startColor, startPoint, endColor, endPoint, cornerRadius)
    }
    
    /**
     自定义设置渐变色
     - parameter startColor:    开始颜色
     - parameter startPoint:    开始位置
     - parameter endColor:      结束颜色
     - parameter endPoint:      结束位置
     - parameter cornerRadius:  圆角大小
    */
    func gradientLayer(_ startColor: UIColor, _ startPoint:CGPoint, _ endColor: UIColor, _ endPoint:CGPoint, _ cornerRadius:CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = base.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.cornerRadius = cornerRadius
        base.layer.insertSublayer(gradient, at: 0)
    }
    
    //MARK: -设置阴影
    
    /**
     添加阴影
     - parameter shadowColor:    阴影颜色
     - parameter shadowOffset:   阴影大小
     - parameter shadowOpacity:  阴影透明度
     - parameter shadowRadius:   阴影圆角
     - parameter cornerRadius:   阴影圆角大小
    */
    func shadow( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat) {
        base.layer.shadowColor = shadowColor.cgColor
        base.layer.shadowOpacity = shadowOpacity
        base.layer.shadowRadius = shadowRadius
        base.layer.shadowOffset = shadowOffset
        base.layer.cornerRadius = cornerRadius
    }
    
    /**
     添加阴影和边框
     - parameter shadowColor:    阴影颜色
     - parameter shadowOffset:   阴影大小
     - parameter shadowOpacity:  阴影透明度
     - parameter shadowRadius:   阴影圆角
     - parameter cornerRadius:   阴影圆角大小
     - parameter borderColor:    边框颜色
     - parameter borderWidth:    边框宽度
    */
    func shadowBorder( _ shadowColor:UIColor, _ shadowOffset:CGSize, _ shadowOpacity:Float, _ shadowRadius:CGFloat, _ cornerRadius:CGFloat, _ borderColor: UIColor, _ borderWidth: CGFloat) {
        base.layer.shadowColor = shadowColor.cgColor
        base.layer.shadowOpacity = shadowOpacity
        base.layer.shadowRadius = shadowRadius
        base.layer.shadowOffset = shadowOffset
        base.layer.cornerRadius = cornerRadius
        base.layer.borderColor = borderColor.cgColor
        base.layer.borderWidth = borderWidth
    }
}
