//
//  NewsViewModel.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {

    @Published var articles = [Article]()
    let service = NewsService()
    
    func downloadNews() async {
        if let returnedArticles = try? await service.downloadNews() {
            articles = returnedArticles.filter({ $0.title != nil && $0.url != nil && $0.urlToImage != nil })
        }
    }
}
