//
//  QuestionBankProvider.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/19.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import SwiftyJSON
// 把不同的业务逻辑拆开管理
class HomeProvider:MoyaProvider<HomeApi> {
    override init(
        endpointClosure:@escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                  requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                  stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
                  callbackQueue: DispatchQueue? = nil,
                  manager: Manager = MoyaProvider<Target>.defaultAlamofireManager(),
                  plugins: [PluginType] = [], trackInflights: Bool = false) {

        super.init(endpointClosure:
            Configuration.default.endpointClosure,
            requestClosure: Configuration.default.requestClosure,
            stubClosure: stubClosure,
            callbackQueue: callbackQueue,
            manager: manager,
            plugins: [Configuration.default.networkPlugin,ErrorPlugin()],
            trackInflights: trackInflights)
    }
   
}
let homeProvider = HomeProvider()


