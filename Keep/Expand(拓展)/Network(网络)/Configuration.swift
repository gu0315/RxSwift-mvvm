//
//  NetworkManager.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/17.
//  Copyright © 2020 顾钱想. All rights reserved.
//
import UIKit
import Moya
import RxSwift
import RxCocoa

class Configuration {
    public static var `default`: Configuration = Configuration()
    ///请求头,根据需要自行配置
    public var httpHeaders: [String: String]? {
        return nil;
    }

    public var timeoutInterval: TimeInterval = 60
    /// 网络请求的设置
    let requestClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<MultiTarget>.RequestResultClosure) in
        guard var request = try? endpoint.urlRequest() else { return }
        request.timeoutInterval = Configuration().timeoutInterval
        // 打印请求参数
//        if let requestData = request.httpBody {
//            print("\(request.url!)" + "\n" + "\(request.httpMethod ?? "")" + "发送参数" + "\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
//        } else {
//            print("\(request.url!)" + "\(String(describing: request.httpMethod))")
//        }
        done(.success(request))
    }


    /// 网络请求的基本设置,这里可以拿到是具体的哪个网络请求，可以在这里做一些设置
    let endpointClosure = { (target: TargetType) -> Endpoint in
        /// 这里把endpoint重新构造一遍主要为了解决网络请求地址里面含有? 时无法解析的bug https://github.com/Moya/Moya/issues/1198
        let url = target.baseURL.absoluteString + target.path
        var task = target.task
        /*如果需要在每个请求中都添加类似token参数的参数请取消注释下面代码
        let additionalParameters = ["token":"888888"]
        let defaultEncoding = URLEncoding.default
        switch target.task {
            ///在你需要添加的请求方式中做修改就行，不用的case 可以删掉。。
        case .requestPlain:
            task = .requestParameters(parameters: additionalParameters, encoding: defaultEncoding)
        case .requestParameters(var parameters, let encoding):
            additionalParameters.forEach { parameters[$0.key] = $0.value }
            task = .requestParameters(parameters: parameters, encoding: encoding)
        default:
            break
        }*/
        var endpoint = Endpoint(
            url: url,
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            task: task,
            httpHeaderFields: Configuration.default.httpHeaders
        )
        return endpoint
    }

    /// 管理网络状态的插件
    let networkPlugin = NetworkActivityPlugin {  type,_  in
        switch type {
        case .began:
            /// 状态栏转圈
            if #available(iOS 13.0, *) {
                //Provide a custom network activity UI in your app if desired
            } else {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }

        case .ended:
            /// 状态栏停止转圈
            if #available(iOS 13.0, *) {
               //Provide a custom network activity UI in your app if desired
            } else {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    /// MARK: - TODO 设置ssl

}
