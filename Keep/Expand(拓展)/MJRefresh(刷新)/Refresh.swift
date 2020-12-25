//
//  Refresh.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/27.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import MJRefresh

extension UIScrollView {

    public var refreshHeader: MJRefreshHeader? {
        get { return mj_header }
        set { mj_header = newValue }
    }

    public var refreshFooter: MJRefreshFooter? {
        get { return mj_footer }
        set { mj_footer = newValue }
    }

    public var isTotalDataEmpty: Bool {
        return mj_totalDataCount() == 0
    }
}

public class RefreshHeader: MJRefreshGifHeader {

    /// 初始化
    override public func prepare() {
        super.prepare()

    }
}

public class RefreshFooter: MJRefreshAutoStateFooter {

    /// 初始化
    override public func prepare() {
        super.prepare()
        triggerAutomaticallyRefreshPercent = 0.5
    }
}

