//
//  Film.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 18/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//
import RxDataSources

struct Film {
//    var unit: Int?
//    var show_id: Int?
//    var show_title: String?
//    var release_year: String?
//    var rating: String?
//    var category: String?
//    var show_cast: String?
//    var director: String?
//    var summary: String?
//    var poster: String?
//    var runtime: String?
    
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var vote_average: Double?
    var title: String?
    var popularity: Double?
    var poster_path: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var release_date: String?
    
    init(jsonDict: [String: Any]) {
        guard let vote_count = jsonDict["vote_count"] as? Int,
        let id = jsonDict["id"] as? Int,
        let video = jsonDict["video"] as? Bool,
        let vote_average = jsonDict["vote_average"] as? Double,
        let title = jsonDict["title"] as? String,
        let popularity = jsonDict["popularity"] as? Double,
        let poster_path = jsonDict["poster_path"] as? String,
        let original_language = jsonDict["original_language"] as? String,
        let original_title = jsonDict["original_title"] as? String,
        let overview = jsonDict["overview"] as? String,
        let release_date = jsonDict["release_date"] as? String
        else {
            return
        }
        
        self.vote_count = vote_count
        self.id = id
        self.video = video
        self.vote_average = vote_average
        self.title = title
        self.popularity = popularity
        self.poster_path = poster_path
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.release_date = release_date
    }
    
}

struct SectionOfFilms {
    var header: String
    var items: [Film]
}
extension SectionOfFilms: SectionModelType {
    typealias Item = Film
    
    init(original: SectionOfFilms, items: [Film]) {
        self = original
        self.items = items
    }
}

