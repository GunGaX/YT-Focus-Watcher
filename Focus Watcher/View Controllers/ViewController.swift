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
        
        title = "Videos"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirmation
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the video that was tapped
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        let detailViewController = segue.destination as! DetailViewController
        
        detailViewController.video = selectedVideo
    }
    
    //MARK: - Model Delegate methods
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        //Refresh the tableView
        tableView.reloadData()
    }

    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VideoCellId, for: indexPath) as! VideoTableViewCell
        
        
        // Configure the cell with data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }

}

