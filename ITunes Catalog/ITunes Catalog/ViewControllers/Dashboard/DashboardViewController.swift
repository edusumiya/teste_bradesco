//
//  ViewController.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import UIKit
import Foundation

class DashboardViewController: UIViewController {
    
    // MARK: Controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: View Objects Methods
    @IBAction func ShowMusicFeed(_ sender: Any) {
        ShowFeed(feedId: .MUSIC)
    }

    @IBAction func ShowMovieFeed(_ sender: Any) {
        ShowFeed(feedId: .MOVIE)
    }
    
    
    // MARK: Other Methods
    func ShowFeed(feedId : FeedCategory) {
        let catalogViewController = self.storyboard?.instantiateViewController(withIdentifier: "CatalogFeed") as! CatalogViewController
        
        catalogViewController.feedId = feedId
        
        self.navigationController?.pushViewController(catalogViewController, animated: true)
    }
}

