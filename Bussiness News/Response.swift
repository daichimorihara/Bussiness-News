//
//  Response.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import Foundation

struct Response: Codable {

    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}

struct Article: Codable, Identifiable {
    var id = UUID().uuidString
    var title: String?
    var url: String?
    var urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case urlToImage
    }
}

struct APIKey {
    static let key = "db4981ecb1e74bab98e8fac384b6e8ba"
}
