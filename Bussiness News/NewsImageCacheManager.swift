//
//  NewsImageCacheManager.swift
//  Bussiness News
//
//  Created by Daichi Morihara on 2022/07/17.
//

import Foundation
import UIKit

class NewsImageCacheManager {
    
    static let instance = NewsImageCacheManager()
    private init() { }
    
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
}
