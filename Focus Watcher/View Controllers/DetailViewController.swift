//
//  DetailViewController.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 07.05.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var channelTitleLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.layer.cornerRadius = 10
        webView.layer.masksToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Clear the fields
        titleLabel.text = ""
        channelTitleLabel.text = ""
        textView.text = ""
        
        // Check if there is video
        guard video != nil else {
            return
        }
        
        // Create an URL
        let embedUrl = Constants.YT_Embed_URL + video!.videoId
        
        // Load WebView
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // Fill the lalbels and views
        titleLabel.text = video!.title
        
        channelTitleLabel.text = video!.chanelTitle
        
        textView.text = video!.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
