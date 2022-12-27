//
//  Article.swift
//  GoodNews
//
//  Created by Bibi on 2022/12/27.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
