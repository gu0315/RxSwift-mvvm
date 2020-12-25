//
//  ViewModel.swift
//  RxStudy
//
//  Created by 顾钱想 on 2019/9/27.
//  Copyright © 2019 顾钱想. All rights reserved.
//

import Foundation
import ActivityIndicator
/// 轻量级 ViewModel，只包含了 error 和耗时操作状态
class ViewModel {

    /// 是否正在加载
    let loading = ActivityIndicator()
    /// track error
    let error = ErrorTracker()

    required init() {}

    deinit {
        print("\(type(of: self)): Deinited")
    }
}

extension ViewModel: HasDisposeBag {}
