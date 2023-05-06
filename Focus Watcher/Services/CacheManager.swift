//
//  CacheManager.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 06.05.2023.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setVideoCache(url: String, data: Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache(url: String) -> Data? {
        
        return cache[url]
    }
}
