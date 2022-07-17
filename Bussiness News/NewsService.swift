//
//  NewsService.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import Foundation

class NewsService {
    func downloadNews() async throws -> [Article] {
        let urlStr = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(APIKey.key)"
        
        guard let url = URL(string: urlStr) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let deco = try? JSONDecoder().decode(Response.self, from: data).articles {
                print(deco)
                return deco
            } else {
                return [Article(title: "a", url: nil, urlToImage: nil)]
            }
        } catch {
            throw error
        }
    }
}
