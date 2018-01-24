//
//  Feed.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation

public class CatalogFeed {
	public var feed : Feed!

    public class func modelsFromDictionaryArray(array:NSArray) -> [CatalogFeed]
    {
        var models:[CatalogFeed] = []
        for item in array
        {
            models.append(CatalogFeed(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		if (dictionary["feed"] != nil) { feed = Feed(dictionary: dictionary["feed"] as! NSDictionary) }
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.feed.dictionaryRepresentation(), forKey: "feed")

		return dictionary
	}

}
