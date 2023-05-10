//
//  ViewController.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 03.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, ModelDelegate {
   
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var model = Model()
    
    var videos = [Video]()
    var filteredVideos: [Video]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Videos"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        searchBar.delegate = self
        
        model.getVideos()
        
        filteredVideos = videos
        
        // Refresh Control to reload the data
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Confirmation
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the video that was tapped
        let selectedVideo = filteredVideos[tableView.indexPathForSelectedRow!.row]
        
        let detailViewController = segue.destination as! DetailViewController
        
        detailViewController.video = selectedVideo
    }
    
    
    // MARK: - Model Delegate methods
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        self.filteredVideos = videos
        
        //Refresh the tableView
        tableView.reloadData()
    }

    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VideoCellId, for: indexPath) as! VideoTableViewCell
        
        
        // Configure the cell with data
        let video = self.filteredVideos[indexPath.row]
        
        cell.setCell(video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredVideos.count
    }
    
    
    // MARK: - Search Bar Methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredVideos = []
        
        if searchText == "" {
            filteredVideos = videos
        } else {
            for v in videos {
                if v.title.lowercased().contains(searchText.lowercased()) {
                    filteredVideos.append(v)
                }
            }
        }
        
        
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.searchBar.endEditing(true)
        }
    
    // MARK: - Reload Control Methods
    
    @objc func pulledToRefresh() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.refreshControl?.endRefreshing()
            
            self.model.getVideos()
            
        }
    }

}

