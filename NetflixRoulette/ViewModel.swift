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
    
    var film: Variable<Film> = Variable<Film>(Film(jsonDict: [:]))
    var title: Variable<String> = Variable<String>("")
    
    var disposeBag = DisposeBag()
    
    init(fachada: Fachada) {
        super.init()
        
        self.fachada = Fachada()
        
        self.setUpBindings()
    }
    
    func getFilms(title: String) -> Observable<Film> {
        return fachada.getFilms(title: title)
    }
    
    func setUpBindings() {
        title.asDriver().throttle(1)
            .drive(onNext: { (t) in
                print(t)
                self.getFilms(title: t).subscribe(onNext: { (film) in
                    self.film.value = film
                }, onError: nil, onCompleted: nil, onDisposed: nil)
                .addDisposableTo(self.disposeBag)
            }, onCompleted: nil, onDisposed: nil)
        .addDisposableTo(disposeBag)
    }
}
