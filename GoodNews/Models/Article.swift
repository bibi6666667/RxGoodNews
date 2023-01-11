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

extension ArticleList {
    static var all: Resource<ArticleList> = {
       let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=API키")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
