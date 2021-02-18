//
//  UIImage+LGL.swift
//  LGLExtension
//
//  Created by Passer on 2021/2/17.
//

import UIKit

extension UIImage: LGLCompatible {}

public extension LGL where Base == UIImage {
    
    /**
     图片旋转90度
    */
    func setImageRotate90() -> UIImage {
        return Base(cgImage:base.cgImage!, scale:base.scale, orientation: .down)
    }
    
    /**
     返回原始图片
    */
    func setImageOriginal() -> UIImage {
        return base.withRenderingMode(.alwaysOriginal)
    }

    /**
     图片拉伸 指定
     - parameter edgeInset:        指定不被拉伸的区域
     - parameter resizeMode:       图片拉伸模式
        resizeMode UIImageResizingModeTile -> 进行区域复制模式拉伸 【-】 -> 【-】【-】【-】
        resizeMode UIImageResizingModeStretch -> 进行渐变复制模式拉伸 连续的 【-】 -> 【-----】
     */
    func setStretchImage(_ edgeInset:UIEdgeInsets, _ resizeMode: UIImage.ResizingMode) -> UIImage {
        return base.resizableImage(withCapInsets:edgeInset, resizingMode: resizeMode)
    }
}
