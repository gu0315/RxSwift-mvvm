//
//  ErrorPlugin.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/21.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit
import Result
import SwiftyJSON
/// 自定义插件
struct ErrorPlugin: PluginType {
  func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
      var result = result
      // 判断是否成功
      if (try? result.value?.filterSuccessfulStatusCodes()) == nil {
          let error: MoyaError = result.error ?? .underlying(LightError(code: 0, message: "抱歉~好像出错了哟~"), result.value)
          return Result<Moya.Response, MoyaError>(error: error)
      }
      switch result {
      case let .success(response):
          ///根据自己业务处理
          do {
             //如果数据返回成功则直接将结果转为JSON
             let json = try JSON(response.mapJSON())
             ///登录状态失效,请重新登录
             if json["status"].intValue == 3 {
                result = Result<Moya.Response, MoyaError>(error: MoyaError.underlying(LightError(code: json["status"].intValue, message: "登录状态失效,请重新登录"), nil))
             }
           } catch _ {
             print("数据解析失败")
           }
      case let .failure(error):
          result = Result<Moya.Response, MoyaError>(error: error)
      }

      return result
  }

}
