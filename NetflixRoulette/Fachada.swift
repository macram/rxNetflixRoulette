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
    let baseUrl = "https://netflixroulette.net/api/api.php?"

    func getFilms(title: String) -> Observable<Film> {
        return RxAlamofire.requestJSON(.get, (baseUrl+"title="+title).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            .map { (r, json) -> [String: Any] in
                print(r)
                guard let jsonDict = json as? [String: Any] else {
                    return [:]
                }
                
                return jsonDict
            }
            .map({Film.init(jsonDict: $0)})
            .asObservable()
    }
    
    func getFilms(actor: String) -> Observable<[Film]> {
        return RxAlamofire.requestJSON(.get, (baseUrl+"actor="+actor).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            .map { (r, json) -> [[String: Any]] in
                print(r)
                guard let jsonDict = json as? [[String: Any]] else {
                    return []
                }
                
                return jsonDict
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
}
