//
//  ViewController.swift
//  Focus Watcher
//
//  Created by Dmytro Savka on 03.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        model.getVideos()
    }


}

