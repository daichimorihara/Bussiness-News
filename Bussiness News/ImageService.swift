//
//  ImageService.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import Foundation
import SwiftUI

class ImageService {
    let manager = NewsImageCacheManager.instance
    

    let article: Article
    init(article: Article) {
        self.article = article
    }
    
    func downloadImage(urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            manager.add(key: article.id, value: image)
            return image
        } catch  {
            return nil
        }
        
    }
}
