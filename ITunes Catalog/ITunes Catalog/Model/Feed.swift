//
//  Feed.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation

public class Feed {
	public var title : String!
	public var id : String!
	public var author : Author!
	public var links : Array<Links>!
	public var copyright : String!
	public var country : String!
	public var icon : String!
	public var updated : String!
	public var results : Array<Results>!

    public class func modelsFromDictionaryArray(array:NSArray) -> [Feed]
    {
        var models:[Feed] = []
        for item in array
        {
            models.append(Feed(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		title = dictionary["title"] as! String
		id = dictionary["id"] as! String
		if (dictionary["author"] != nil) { author = Author(dictionary: dictionary["author"] as! NSDictionary) }
		if (dictionary["links"] != nil) { links = Links.modelsFromDictionaryArray(array: dictionary["links"] as! NSArray) }
		copyright = dictionary["copyright"] as! String
		country = dictionary["country"] as! String
		icon = dictionary["icon"] as! String
		updated = dictionary["updated"] as! String
		if (dictionary["results"] != nil) { results = Results.modelsFromDictionaryArray(array: dictionary["results"] as! NSArray) }
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.author?.dictionaryRepresentation(), forKey: "author")
		dictionary.setValue(self.copyright, forKey: "copyright")
		dictionary.setValue(self.country, forKey: "country")
		dictionary.setValue(self.icon, forKey: "icon")
		dictionary.setValue(self.updated, forKey: "updated")

		return dictionary
	}

}
