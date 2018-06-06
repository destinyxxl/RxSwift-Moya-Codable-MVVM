//
//  ApiManager.swift
//  RxSwift Demo
//
//  Created by 冯晓林 on 2018/6/4.
//  Copyright © 2018年 WeShion. All rights reserved.
//

import Foundation
import Moya

let provider = MoyaProvider<Api>()

enum Api {
    case getNewsList
}

extension Api: TargetType {

    var baseURL: URL { return URL(string: "http://news-at.zhihu.com/api/")! }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .getNewsList:
            return "4/news/latest"
        }
    }
    
    /// The HTTP method used in the request.
    var method: Moya.Method {
        switch self {
        case .getNewsList:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .getNewsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}
