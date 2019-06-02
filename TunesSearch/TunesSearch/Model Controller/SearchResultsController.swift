//
//  SearchResultsController.swift
//  TunesSearch
//
//  Created by Julian A. Fordyce on 6/2/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

class SearchResultsController {
    
    func fetchMusicResults(_ completion: @escaping ([Result]?) -> Void) {
        
        let url = baseURL.appendingPathComponent("us/apple-music/top-albums/all/25/explicit").appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                NSLog("Error with data task: \(error)")
                completion(nil)
                return
            }
            
            if let response = response {
                NSLog("\(response)")
                completion(nil)
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SearchResults.self, from: data)
                self.results = results.feed.results
                completion(self.results)
            } catch {
                NSLog("Unable to Decode JSON: \(error)")
                completion(nil)
                
            }
        }.resume()
    }
    
    func fetchAppResults(_ completion: @escaping ([Result]?) -> Void) {
        
        let url = baseURL.appendingPathComponent("/us/ios-apps/new-apps-we-love/all/25/explicit").appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                NSLog("Error with data task: \(error)")
                completion(nil)
                return
            }
            
            if let response = response {
                NSLog("\(response)")
                completion(nil)
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SearchResults.self, from: data)
                self.results = results.feed.results
                completion(self.results)
            } catch {
                NSLog("Unable to Decode JSON: \(error)")
                completion(nil)
                
            }
        }.resume()
    }
        
    func fetchMovieResults(_ completion: @escaping ([Result]?) -> Void) {
        
        let url = baseURL.appendingPathComponent("/us/movies/top-movies/all/25/explicit").appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                NSLog("Error with data task: \(error)")
                completion(nil)
                return
            }
           
            
            if let response = response {
                NSLog("\(response)")
                completion(nil)
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SearchResults.self, from: data)
                self.results = results.feed.results
                completion(self.results)
            } catch {
                NSLog("Unable to Decode JSON: \(error)")
                completion(nil)
                
            }
        }.resume()
    }
        
    func fetchMusicFeed(_ completion: @escaping (Feed?) -> Void) {
        
        let url = baseURL.appendingPathComponent("us/apple-music/top-albums/all/25/explicit.json")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                NSLog("Unable to get data: \(error)")
                completion(nil)
                return
            }
            
            if let response = response {
                NSLog("\(response)")
                completion(nil)
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SearchResults.self, from: data)
                self.feed = results.feed
                completion(self.feed)
            } catch {
                NSLog("Unable to Decode JSON: \(error)")
                completion(nil)
                
            }
            }.resume()
        
    }
    
    func fetchAppFeed(_ completion: @escaping (Feed?) -> Void) {
        
        let url = baseURL.appendingPathComponent("/us/ios-apps/new-apps-we-love/all/25/explicit").appendingPathExtension("json")

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                NSLog("Unable to get data: \(error)")
                completion(nil)
                return
            }
            
            if let response = response {
                NSLog("\(response)")
                completion(nil)
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SearchResults.self, from: data)
                self.feed = results.feed
                completion(self.feed)
            } catch {
                NSLog("Unable to Decode JSON: \(error)")
                completion(nil)
                
            }
        }.resume()
        
    }
    
    
    
    func fetchMovieFeed(_ completion: @escaping (Feed?) -> Void) {
        
        let url = baseURL.appendingPathComponent("/us/movies/top-movies/all/25/explicit").appendingPathExtension("json")

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                NSLog("Unable to get data: \(error)")
                completion(nil)
                return
            }
            
            if let response = response {
                NSLog("\(response)")
                completion(nil)
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(SearchResults.self, from: data)
                self.feed = results.feed
                completion(self.feed)
            } catch {
                NSLog("Unable to Decode JSON: \(error)")
                completion(nil)
                
            }
            }.resume()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Properties
    
    var feed: Feed?
    var results: [Result] = []
    private let baseURL = URL(string: "https://rss.itunes.apple.com/api/v1")!
    
    
}
