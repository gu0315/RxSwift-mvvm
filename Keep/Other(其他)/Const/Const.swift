//
//  Const.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/7.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
///MARK: ipad判断
let KIsIpad = UIDevice.current.model == "iPad" ? true : false

/// 是否是X系列
let KIsX = (KIsIpad ? false :(DEVICE_HEIGHT >= 812 ? true:false))

///MARK:取当前屏幕高度
let DEVICE_HEIGHT = KIsIpad ? UIScreen.main.bounds.size.height :
    max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)

///MARK:取当前屏幕宽度
let DEVICE_WIDTH = KIsIpad ? UIScreen.main.bounds.size.width :
    min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)

///MARK:状态栏高度
let KStatusBarFrame = UIApplication.shared.statusBarFrame.height


/// 首页左右两侧间距
let KHomeContentInset: CGFloat = 15
