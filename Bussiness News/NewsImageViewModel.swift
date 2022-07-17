//
//  NewsImageViewModel.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import Foundation
import UIKit

@MainActor
class NewsImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    let article: Article
    let service: ImageService
    let manager = NewsImageCacheManager.instance
    
    init(article: Article) {
        self.article = article
        self.service = ImageService(article: article)
    }
    
    func getImage() async {
        if let savedImage = manager.get(key: article.id) {
            self.image = savedImage
        } else {
            guard let urlStr = article.urlToImage else { return }
            self.image = await service.downloadImage(urlString: urlStr)
        }
    }
    
    
}
