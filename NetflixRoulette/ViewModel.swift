//
//  ViewModel.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 18/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewModel: NSObject {
    var fachada: Fachada!
    
//    var films: Variable<Film>
    
    var title: Variable<String>?
    
    init(fachada: Fachada) {
        self.fachada = Fachada()
    }
    
    func getFilms(title: String) -> Observable<Film> {
        return fachada.getFilms(title: title)
    }
}
