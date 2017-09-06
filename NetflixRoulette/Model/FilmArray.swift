//
//  FilmArray.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 6/9/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit

struct FilmArray {
    var films: [Film]
    
    init(json: [[String: Any]]) {
        films = [Film]()
        for element in json {
            films.append(Film(jsonDict: element))
        }
    }
}
