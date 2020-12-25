//
//  AppConfigs.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/17.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

struct Configs {

    struct Network {
        static let linkURL = "https://api.gotokeep.com"
        static let baseUrl = "https://api.gotokeep.com"
        static let environment = "环境：预发"
    }


    struct Time {
        static let imageTransition: TimeInterval = 1.0
        /// 图片缓存时间 (1 周)
        static let maxImageCache: TimeInterval = 60 * 60 * 24 * 7
        /// 图片加载超时时间
        static let imageDownloadTimeout: TimeInterval = 15
        /// 网络请求超时时间
        static let netWorkTimeout: TimeInterval = 15
    }
}
