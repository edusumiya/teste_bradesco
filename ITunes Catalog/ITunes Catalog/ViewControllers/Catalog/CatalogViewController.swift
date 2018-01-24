//
//  MusicFeedViewController.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit
import PKHUD
class CatalogViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: View Objects
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblResults: UILabel!
    @IBOutlet weak var lblCopyright: UILabel!
    @IBOutlet weak var tblCatalog: UITableView!
    
    // MARK: Variables
    public var feedId : FeedCategory!
    public var catalog : CatalogFeed!
    
    // MARK: Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do
        {
            self.tblCatalog.register(UINib(nibName: "CatalogItemTableViewCell", bundle: nil), forCellReuseIdentifier: "CatalogItem")
            
            self.tblCatalog.contentInset = UIEdgeInsets(top: -100, left: 0, bottom: -20, right: 0)
            
            self.tblCatalog?.delegate = self
            self.tblCatalog?.dataSource = self
            
            self.title = self.catalog.feed.title
            self.lblName.text = self.catalog.feed.author.name
            self.lblResults.text = String(self.catalog.feed.results.count) + " Results"
            self.lblCopyright.text = self.catalog.feed.copyright
            
            let url:URL = URL.init(string: self.catalog.feed.icon)!
            let data: Data = try Data.init(contentsOf: url)
            self.imgIcon.image = UIImage(data:data)
        }
        catch
        {
            print("Fail to Config Screen")
        }
        
        PKHUD.sharedHUD.hide()
    }
    
    // MARK: TableView Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.feed.results.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogItem", for: indexPath) as! CatalogItemTableViewCell
        
        do
        {
            let catalogItem = catalog.feed.results[indexPath.item]
            
            let url:URL = URL.init(string: catalogItem.artworkUrl100)!
            let data: Data = try Data.init(contentsOf: url)
            
            let image = UIImage(data:data)
            let title = catalogItem.name
            let artist = catalogItem.artistName
            
            cell.setData(catalogImage: image, title: title, author: artist)
            
            return cell
        }
        catch
        {
            PKHUD.sharedHUD.contentView = PKHUDTextView(text: "Fail to create Cell from Table")
            PKHUD.sharedHUD.show()
            return cell
        }
    }
    
    // MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let catalogDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CatalogDetail") as! CatalogDetailViewController
        
        catalogDetailViewController.resultItem = catalog.feed.results[indexPath.item]
        
        self.navigationController?.pushViewController(catalogDetailViewController, animated: true)
    }
}
