//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Bibi on 2022/12/26.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell does not exist")
        }
        
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].description
        
        return cell
    }
    
    
    private func populateNews() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=API키")!
        
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
                // 리턴타입 명시한 이유 : 타입 추론이 안 될 수 있기 때문. 특히 지금처럼 여러 결과를 join하는 경우에.
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request) // Observable<data> 반환
            }.map { data -> [Article]? in
                return try? JSONDecoder().decode(ArticleList.self, from: data).articles
            }.subscribe(onNext: { [weak self] articles in
                if let articles = articles {
                    self?.articles = articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
    
}
