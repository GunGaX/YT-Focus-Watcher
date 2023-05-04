//
//  ViewController.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 03.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    //MARK: - Model Delegate methods
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        //Refresh the tableView
        tableView.reloadData()
    }

    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VideoCellId, for: indexPath)
        
        // Configure the cell with data
        
        
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

}

