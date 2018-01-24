//
//  Results.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation

public class Results {
	public var artistName : String!
	public var id : String!
	public var releaseDate : String!
	public var name : String!
	public var collectionName : String?
	public var kind : String!
	public var copyright : String?
	public var artistId : String?
	public var artistUrl : String?
	public var artworkUrl100 : String!
	public var genres : Array<Genres>!
	public var url : String!

    public class func modelsFromDictionaryArray(array:NSArray) -> [Results]
    {
        var models:[Results] = []
        for item in array
        {
            models.append(Results(dictionary: item as! NSDictionary))
        }
        return models
    }

	required public init(dictionary: NSDictionary) {

		artistName = dictionary["artistName"] as! String
		id = dictionary["id"] as! String
		releaseDate = dictionary["releaseDate"] as! String
		name = (dictionary["name"] as? String)!
		collectionName = dictionary["collectionName"] as? String
		kind = (dictionary["kind"] as? String)!
		copyright = dictionary["copyright"] as? String
		artistId = dictionary["artistId"] as? String
		artistUrl = dictionary["artistUrl"] as? String
		artworkUrl100 = dictionary["artworkUrl100"] as! String
		if (dictionary["genres"] != nil) { genres = Genres.modelsFromDictionaryArray(array: dictionary["genres"] as! NSArray) }
		url = dictionary["url"] as! String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.artistName, forKey: "artistName")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.releaseDate, forKey: "releaseDate")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.collectionName, forKey: "collectionName")
		dictionary.setValue(self.kind, forKey: "kind")
		dictionary.setValue(self.copyright, forKey: "copyright")
		dictionary.setValue(self.artistId, forKey: "artistId")
		dictionary.setValue(self.artistUrl, forKey: "artistUrl")
		dictionary.setValue(self.artworkUrl100, forKey: "artworkUrl100")
		dictionary.setValue(self.url, forKey: "url")

		return dictionary
	}

}
