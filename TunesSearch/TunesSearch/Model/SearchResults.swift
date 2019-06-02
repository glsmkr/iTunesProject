//
//  SearchResults.swift
//  TunesSearch
//
//  Created by Julian A. Fordyce on 6/2/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct SearchResults: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let results: [Result]
}

struct Author: Codable {
    let name: String
    let uri: String
}

struct Link: Codable {
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }
}

struct Result: Codable {
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: Kind?
    let copyright, artistID: String?
    let contentAdvisoryRating: String?
    let artistURL: String?
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case contentAdvisoryRating
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}

struct Genre: Codable {
    let genreID, name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}

enum Kind: String, Codable {
    case album = "album"
    case movie = "movie"
    case iosSoftware = "iosSoftware"
}

