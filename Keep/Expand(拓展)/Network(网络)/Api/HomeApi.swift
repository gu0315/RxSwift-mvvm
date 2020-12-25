//
//  HomeApi.swift
//  GkIos
//
//  Created by 顾钱想 on 2020/8/26.
//  Copyright © 2020 顾钱想. All rights reserved.
//
import Moya
enum HomeApi {
  //首页热门瀑布流
  case waterfall(position: Int, lastId: String)
  //首页推荐
  case recomment(sessionId: String, lastId: String)
  //首页关注
  case attention(position: Int, lastId: String, firstId: String)
}

extension HomeApi: TargetType {
    var baseURL: URL {
        return URL(string: Configs.Network.baseUrl)!
    }
    var path: String {
        switch self {
        case .waterfall:
            return "/feed/v1/feed/list"
        case .recomment:
            return "/feed/v1/feed/list"
        case .attention:
            return "/social-network/v1/feed/list"
        }
    }

    var method: Moya.Method{
        switch self {
        default:
            return .get
        }
    }

    var sampleData: Data {
         return "".data(using: String.Encoding.utf8)!
    }

    var task: Task {
        switch self {
            case let .waterfall(position, lastId):
                return .requestParameters(parameters:[
                "feedType": "hot",
                "needCommentInfo": 1,
                "needFavoriteInfo": 1,
                "needLikeInfo": 1,
                "needRelationInfo": 1,
                "position": position,
                "sort": "byTime",
                "lastId": lastId],
                encoding:  URLEncoding.default)
             case let .recomment(sessionId, lastId):
                return .requestParameters(parameters:[
                "feedId":"",
                "feedType": "sports",
                "limit":10,
                "needCommentInfo": 0,
                "needFavoriteInfo": 1,
                "needLikeInfo": 1,
                "needRelationInfo": 1,
                "sessionId": sessionId,
                "sort": "byTime",
                "lastId": lastId],
                encoding:  URLEncoding.default)
             case let .attention(position, lastId, firstId):
                if lastId.isEmpty {
                    return .requestParameters(parameters:[
                    "firstId": firstId,
                    "position": position],
                    encoding:  URLEncoding.default)
                } else {
                    return .requestParameters(parameters:[
                    "position": position,
                    "lastId": lastId],
                    encoding:  URLEncoding.default)
               }
            }
        }
    var headers: [String : String]? {
        return nil
    }
}
