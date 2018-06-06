//
//  Response+Extention.swift
//  RxSwift Demo
//
//  Created by 冯晓林 on 2018/6/4.
//  Copyright © 2018年 WeShion. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension Response {
    func mapModel<T: Codable>(_ type: T.Type) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw MoyaError.jsonMapping(self)
        }
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    func mapModel<T: Codable>(_ type: T.Type) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.just(try response.mapModel(T.self))
        }
    }
}
