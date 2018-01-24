//
//  CatalogDetail.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 23/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

class CatalogDetailViewController: UIViewController {

    // MARK: View Objects
    @IBOutlet weak var imgCatalog: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCollectionName: UILabel!
    @IBOutlet weak var lblArtist: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblCopyright: UILabel!
    
    public var resultItem : Results!
    
    // MARK: Controller
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        do
        {
            let url:URL = URL.init(string: resultItem.artworkUrl100)!
            let data: Data = try Data.init(contentsOf: url)
            
            imgCatalog.image = UIImage(data:data)
            
            lblName.text = resultItem.name
            lblCollectionName.text = resultItem.collectionName
            lblArtist.text = resultItem.artistName
            
            for genre in resultItem.genres {
                if lblGenre.text == "Genre"
                {
                    lblGenre.text = "Genre: " + genre.name
                }
                else
                {
                   lblGenre.text = lblGenre.text! + "/ " + genre.name
                }
                
            }
            
            lblReleaseDate.text = "Release Date: " + resultItem.releaseDate
            
            lblCopyright.text = resultItem.copyright
        }
        catch
        {
            PKHUD.sharedHUD.contentView = PKHUDTextView(text: "Fail to Fill the Catalog Detail")
            PKHUD.sharedHUD.show()
        }

    }
}
