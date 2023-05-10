//
//  Constants.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 03.05.2023.
//

import Foundation

struct Constants {
    
    // API key is hidden, and you need to use yours personal token!!!
    static var API_KEY = ""
    // Playlist ID is hidden as well, use your playlist ID instead :)
    static var PlAYLIST_ID = ""
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PlAYLIST_ID)&maxResults=50&key=\(Constants.API_KEY)"
    
    static var VideoCellId = "VideoCell"
    
    static var YT_Embed_URL = "https://www.youtube.com/embed/"
    
}
