//
//  Model.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 03.05.2023.
//

import Foundation

class Model {
    func getVideos() {
        
        // Create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from session
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error != nil || data == nil {
                return
            }
            
            
            do {
                // Parsing the data
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                print("An error has occurred while parsing data")
            }
            
        }
        
        // Kick off the task
        dataTask.resume()
    }
}
