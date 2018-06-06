//
//  NewsListModel.swift
//  RxSwift Demo
//
//  Created by 冯晓林 on 2018/6/4.
//  Copyright © 2018年 WeShion. All rights reserved.
//

import Foundation

struct NewsList: Codable {
    
    let date : String
    let stories : [Story]
    let topStories : [Story]
    
    enum CodingKeys: String, CodingKey { //enum类型名必须叫 CodingKeys ？？？
        case date
        case stories
        case topStories = "top_stories"
    }
    
}

struct Story: Codable {
    
    let gaPrefix : String
    let id : Int
    let image : String?
    let images : [String]?
    let title : String
    let type : Int
    
    enum CodingKeys: String, CodingKey {
        case gaPrefix = "ga_prefix"
        case id
        case image
        case images
        case title
        case type
    }
    
}
