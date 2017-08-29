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
    let baseUrl = "https://netflixroulette.net/api/api.php?title="

    func getFilms(title: String) -> Observable<Film> {
        return RxAlamofire.requestJSON(.get, (baseUrl+title).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
            .map { (r, json) -> [String: Any] in
                guard let jsonDict = json as? [String: Any] else {
                    return [:]
                }
                
                return jsonDict
            }
            .map({Film.init(jsonDict: $0)})
            .asObservable()
    }
}
