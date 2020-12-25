//
//  ResponseModel.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/20.
//  Copyright © 2020 顾钱想. All rights reserved.
//

///根据自己公司结构配置
class ResponseModel: NSObject,Mappable {
    /// 返回码
    var errorCode:Int = 0
    /// 信息
    var errorMes:String = ""
    /// 数据
    var dada:Any?

    override init() {super.init()}

    init(errorCode: Int,errorMes:String,dada:Any? = nil) {
        self.errorCode = errorCode
        self.errorMes = errorMes
        self.dada = dada
    }

    class func success(data:Any) ->ResponseModel{
        return ResponseModel(errorCode: 1, errorMes: "",dada: data)
    }

    class func faild(message:String? = "FAILD") ->ResponseModel{
        return ResponseModel(errorCode: 0, errorMes: message ?? "FAILD", dada: nil)
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        self.errorCode  <- map["errorCode"]
        self.errorMes <- map["text"]
        self.dada <- map["dada"]
    }
}
