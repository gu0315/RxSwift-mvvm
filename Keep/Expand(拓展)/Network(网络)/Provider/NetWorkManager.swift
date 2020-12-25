//
//  NetWorkManager.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/21.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

class NetWorkManager {
      /// 处理成功的返回结果
      static func getResponse(_ success:Moya.Response) ->ResponseModel {
          var responseModel:ResponseModel = ResponseModel()
          do {
              responseModel =  try success.mapObject(ResponseModel.self)
          }catch{
              responseModel.errorCode = 200
              responseModel.errorMes = "无法解析网络返回数据"
          }
          //TODO: 根据各自业务需求，可对一些返回结果做出特殊处理😅
          if responseModel.errorCode == 200 ,responseModel.errorMes == "SUCCESS",responseModel.dada == nil {
             responseModel.errorMes = "没有更多了"
          }
          return responseModel
      }

      /// 处理失败的返回结果
      static func getResponse(_ error:MoyaError) ->ResponseModel {
          let responseModel:ResponseModel = ResponseModel()
            
          responseModel.errorCode = 500
          responseModel.errorMes = error.errorDescription ?? "网络访问出错"
          return responseModel
      }
}
