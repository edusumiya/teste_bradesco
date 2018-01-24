//
//  Genres.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//


import Foundation

public class Genres {
	public var genreId : String!
	public var name : String!
	public var url : String!

    public class func modelsFromDictionaryArray(array:NSArray) -> [Genres]
    {
        var models:[Genres] = []
        for item in array
        {
            models.append(Genres(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		genreId = dictionary["genreId"] as! String
		name = dictionary["name"] as! String
		url = dictionary["url"] as! String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.genreId, forKey: "genreId")
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.url, forKey: "url")

		return dictionary
	}

}
