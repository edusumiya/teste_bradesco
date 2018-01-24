//
//  MusicCatalogPresenter.swift
//  ITunes Catalog
//
//  Created by Eduardo Sumiya on 22/01/18.
//  Copyright © 2018 Eduardo Sumiya. All rights reserved.
//

import Foundation

class CatalogAPI
{
    
    // MARK: API URLs
    static let urlMusic : String = "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/20/explicit.json"
    static let urlMovie : String = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/20/explicit.json"
    
    // MARK: API Methods
    static func GetFeed(feedId : FeedCategory, completion: @escaping (_ result : CatalogFeed) -> Void){
        
        let url = URL(string: (feedId == .MUSIC ? urlMusic : urlMovie))
        
        var catalogFeed : CatalogFeed
        
        let task = URLSession.shared.synchronousDataTask(with: url!)
        
        do
        {
            let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: task.0!, options: .allowFragments) as! [String: Any]
            
            catalogFeed = CatalogFeed(dictionary: someDictionaryFromJSON as NSDictionary)!
            
            completion(catalogFeed)
        }
        catch
        {
            print("Fail to Get Feed from Internet")
        }
    }
}

// MARK: Extensions
extension URLSession {
    func synchronousDataTask(with url: URL) -> (Data?, URLResponse?, Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let dataTask = self.dataTask(with: url) {
            data = $0
            response = $1
            error = $2
            
            semaphore.signal()
        }
        dataTask.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        return (data, response, error)
    }
}

