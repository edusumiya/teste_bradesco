//
//  CatalogItemCollectionViewCell.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 23/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation
import UIKit

class CatalogItemTableViewCell: UITableViewCell {
    
    @IBOutlet var imgCatalog: UIImageView?
    
    @IBOutlet var lblTitleCatalog: UILabel?
    
    @IBOutlet var lblAuthorCatalog: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
    }
    
    func setData(catalogImage : UIImage!, title : String!, author : String!) {
        imgCatalog?.image = catalogImage
        lblTitleCatalog?.text = title
        lblAuthorCatalog?.text = author
    }
}
