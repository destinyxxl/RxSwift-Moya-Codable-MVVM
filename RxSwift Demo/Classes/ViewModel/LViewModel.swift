//
//  LViewModel.swift
//  RxSwift Demo
//
//  Created by 冯晓林 on 2018/6/4.
//  Copyright © 2018年 WeShion. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class LViewModel {
    
    //        //注释方法为 可自定义map方式 参考：https://github.com/Moya/Moya/blob/master/docs/Examples/Response.md
    //                let decoder = JSONDecoder()
    //                decoder.keyDecodingStrategy = .convertFromSnakeCase
    //
    //               provider.rx.request(.getNewsList)
    //                          .map(NewsList.self, atKeyPath: nil, using: decoder, failsOnEmptyData: true)
    
    func getDataObservable() -> PrimitiveSequence<SingleTrait, NewsList> {
        return provider.rx.request(.getNewsList)
                          .map(NewsList.self)
    }

}
