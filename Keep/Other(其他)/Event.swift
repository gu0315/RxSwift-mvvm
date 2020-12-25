//
//  Event.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/9.
//  Copyright © 2020 顾钱想. All rights reserved.
//
import UIKit
import ImageIO
class Event: NSObject {

   static let share = Event()


    /// 返回图片尺寸
    /// - Parameter str: 图片地址
    /// - Returns: 图片尺寸
   func imageSise(str: String) -> CGSize {
       ///https://static1.keepcdn.com/picture/2020/08/06/15/24/a6e9e3667cdaaa635c507fa87511ce4b56c42c44_576x768.jpg
      let imgUrl = URL.init(string: str)
      if (imgUrl != nil) {
        let lastPathComponent = imgUrl?.lastPathComponent.components(separatedBy: ".").first
        let splitedArray = lastPathComponent?.components(separatedBy: "_").last?.components(separatedBy: "x").compactMap {
            NSInteger($0)
        }
        if splitedArray?.count == 2 {
            return CGSize.init(width: splitedArray?.first ?? 0, height: splitedArray?.last ?? 0)
        } else {
            // MARK: - TODO获取网路图片
            return CGSize.zero
        }
      } else {
        return CGSize.zero
      }
   }
}
