//
//  VideoTableViewCell.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 06.05.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ChannelTitleLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v

        
        guard self.video != nil else {
            return
        }
        
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the chanel title
        self.ChannelTitleLabel.text = video?.chanelTitle
        
        // Set the thumbnail
        guard self.video?.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(url: self.video!.thumbnail) {
            
            // Set the image
            self.thumbnailImageView.image = UIImage(data: cachedData)
            
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                // Save data in the cache
                CacheManager.setVideoCache(url: url!.absoluteString, data: data)
                
                // Check the url
                if url?.absoluteString != self.video?.thumbnail {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
    }

}
