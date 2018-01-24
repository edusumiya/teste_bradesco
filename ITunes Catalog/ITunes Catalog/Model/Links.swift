//
//  Links.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation

public class Links {
	public var links : String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [Links]
    {
        var models:[Links] = []
        for item in array
        {
            models.append(Links(dictionary: item as! NSDictionary)!)
        }
        return models
    }

	required public init?(dictionary: NSDictionary) {

		links = dictionary["self"] as? String
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.links, forKey: "self")

		return dictionary
	}

}
