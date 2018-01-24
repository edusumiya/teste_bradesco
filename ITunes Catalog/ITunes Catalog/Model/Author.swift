//
//  Author.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation

public class Author {
	public var name : String!
	public var uri : String!

    public class func modelsFromDictionaryArray(array:NSArray) -> [Author]
    {
        var models:[Author] = []
        for item in array
        {
            models.append(Author(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		name = dictionary["name"] as! String
		uri = dictionary["uri"] as! String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.uri, forKey: "uri")

		return dictionary
	}

}
