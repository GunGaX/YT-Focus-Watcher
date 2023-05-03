//
//  Constants.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 03.05.2023.
//

import Foundation

struct Constants {
    
    static var API_KEY = "[AIzaSyBL4Y93mjxTFepfwrN8MegU57u1fjcldl0]"
    static var PlAYLIST_ID = "2C1QfkC1DOKW2nu"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PlAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
