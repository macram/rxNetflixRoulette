//
//  Fachada.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 18/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire

class Fachada: NSObject {
    let movieUrl = "https://api.themoviedb.org/3/search/movie?api_key=36d84766dbeb80f9997fcac3fc7ef85c&language=es-ES&page=1&include_adult=true"
    let peopleUrl = "https://api.themoviedb.org/3/search/person?api_key=36d84766dbeb80f9997fcac3fc7ef85c&language=es-ES&page=1&include_adult=true"

    func getFilms(title: String) -> Observable<Film> {
        return RxAlamofire.requestJSON(.get, (movieUrl+"&query="+title).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            .map { (r, json) -> [[String: Any]] in
                print(r)
                guard let jsonDict = json as? [String: Any], let result = jsonDict["results"] as? [[String: Any]] else {
                    return []
                }
                
                return result
            }
            .map({
                var array = [Film]()
                for element in $0 {
                    array.append(Film.init(jsonDict: element))
                }
                return array.first ?? Film(jsonDict: [:])
            })
            .asObservable()
    }
    
    func getFilms(actor: String) -> Observable<[Film]> {
        return RxAlamofire.requestJSON(.get, (peopleUrl+"&query="+actor).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            .map { (r, json) -> [[String: Any]] in
                print(r)
                guard let jsonDict = json as? [String: Any], let result = jsonDict["results"] as? [[String: Any]] else {
                    return []
                }
                guard !result.isEmpty, let films = result[0]["known_for"] as? [[String:Any]] else {
                    return []
                }
                return films
            }
            .map({
                var array = [Film]()
                for element in $0 {
                    array.append(Film.init(jsonDict: element))
                }
                return array
            })
            .asObservable()
    }
    
    func getImage(url: String) -> Observable<UIImage> {
        return RxAlamofire.requestData(.get, url)
            .map({ (r, data) -> UIImage in
                guard let image = UIImage(data: data) else {
                    return UIImage()
                }
                return image
            })
        .asObservable()
    }
}
