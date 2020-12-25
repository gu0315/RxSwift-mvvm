//
//  LightError.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/21.
//  Copyright © 2020 顾钱想. All rights reserved.
//

import UIKit

public struct LightError: Error {
    public let code: Int
    public let message: String
}

extension Error {
    var errorMessage: String {
        guard
            let error = self as? MoyaError
        else {
            return "网络请求失败"
        }
        switch error {
        case let .underlying(error, _):
            if let error = error as? LightError {
                return error.message
            }
        case let .statusCode(response):
            return "\(response.statusCode)错误"
        case let .objectMapping(error, _):
            if let error = error as? LightError {
                return error.message
            }
        default:
            break
        }
        return "网络请求失败"
    }

    var code: Int {
        guard
            let error = self as? MoyaError
        else {
            return 0
        }
        switch error {
        case let .underlying(error, _):
            if let error = error as? LightError {
                return error.code
            }
        case .statusCode:
            return 0
        case let .objectMapping(error, _):
            if let error = error as? LightError {
                return error.code
            }
        default:
            break
        }
        return 0
    }
}
