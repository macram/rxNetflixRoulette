//
//  FilmsViewModel.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 6/9/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilmsViewModel: NSObject {
    var fachada: Fachada!
    
    var films: Variable<[Film]> = Variable<[Film]>([])
    var actor: Variable<String> = Variable<String>("")
    var obsFilms: Observable<[SectionOfFilms]>?
    
    var disposeBag = DisposeBag()
    
    init(fachada: Fachada) {
        super.init()

        self.fachada = fachada
        
        self.setUpBindings()
        
        obsFilms = films.asObservable()
            .map({ (films) -> [SectionOfFilms] in
                return [SectionOfFilms(header: "", items: films)]
            })
    }
    
    func getFilms(actor: String) -> Observable<[Film]> {
        return fachada.getFilms(actor: actor)
    }
    
    func setUpBindings() {
        print("Setup bindings")
        actor.asDriver().throttle(1)
            .drive(onNext: { (a) in
                self.getFilms(actor: a).subscribe({ (films) in
                    if films.element != nil {
                        self.films.value = films.element!
                    }
                })
                    .addDisposableTo(self.disposeBag)
            }, onCompleted: nil, onDisposed: nil)
            .addDisposableTo(disposeBag)
    }

}
