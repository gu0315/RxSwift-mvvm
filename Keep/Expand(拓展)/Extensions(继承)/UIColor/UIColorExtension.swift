//
//  UIColorExtension.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/7.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import Foundation

public extension UIColor {
    /// 获取随机颜色
    ///
    /// - Returns: 随机颜色
    class func randomColor() -> UIColor {
       let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
       let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
       let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
       return UIColor(red:red, green:green, blue:blue , alpha: 1)
    }

    /// 通过 0x34e4e4 16进制获取颜色
    ///
    /// - Parameter hexColor:  16进制
    /// - Returns: 颜色
    class func colorWithHex(hexColor:Int64)->UIColor{
        return colorWithHex(hexColor: hexColor,alpha: 1);
    }

    /// 通过 Int64 获取颜色
    ///
    /// - Parameters:
    ///   - hexColor: 0x34e4e4 16进制
    ///   - alpha: 透明度
    /// - Returns: 颜色
    class func colorWithHex(hexColor:Int64,alpha:CGFloat)->UIColor{
        let red = ((CGFloat)((hexColor & 0xFF0000) >> 16))/255.0;
        let green = ((CGFloat)((hexColor & 0xFF00) >> 8))/255.0;
        let blue = ((CGFloat)(hexColor & 0xFF))/255.0;
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static func RGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    /// 标题颜色
    static var titleColor: UIColor {
        return .RGBA(153, 153, 153)
    }
    /// 标题选择颜色
    static var titleSelectedColor: UIColor {
        return .RGBA(51, 51, 51)
    }

}

