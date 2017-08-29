//
//  Film.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 18/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

struct Film {
    var unit: Int?
    var show_id: Int?
    var show_title: String?
    var release_year: String?
    var rating: String?
    var category: String?
    var show_cast: String?
    var director: String?
    var summary: String?
    var poster: String?
    var runtime: String?
    
    init(jsonDict: [String: Any]) {
        guard let unit = jsonDict["unit"] as? Int,
        let show_id = jsonDict["show_id"] as? Int,
        let show_title = jsonDict["show_title"] as? String,
        let release_year = jsonDict["release_year"] as? String,
        let rating = jsonDict["rating"] as? String,
        let category = jsonDict["category"] as? String,
        let show_cast = jsonDict["show_cast"] as? String,
        let director = jsonDict["director"] as? String,
        let summary = jsonDict["summary"] as? String,
        let poster = jsonDict["poster"] as? String,
        let runtime = jsonDict["runtime"] as? String
        else {
            return
        }
        
        self.unit = unit
        self.show_id = show_id
        self.show_title = show_title
        self.release_year = release_year
        self.rating = rating
        self.category = category
        self.show_cast = show_cast
        self.director = director
        self.summary = summary
        self.poster = poster
        self.runtime = runtime
    }
    
}
