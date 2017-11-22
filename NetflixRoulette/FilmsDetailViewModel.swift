//
//  FilmsDetailViewModel.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 8/9/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import RxSwift
import RxCocoa

class FilmsDetailViewModel: NSObject {
    var imageUrl = Variable<String>("")
    var image: Variable<UIImage> = Variable<UIImage>(UIImage())
    
    var fachada: Fachada!
    
    var disposeBag = DisposeBag()
    
    init(fachada: Fachada) {
        super.init()
        
        self.fachada = fachada
        
        self.setUpBindings()
    }
    
    func setUpBindings() {
        imageUrl.asDriver()
            .drive(onNext: { (i) in
                let realUrl = ("https://image.tmdb.org/t/p/w500" + i)
                print(realUrl)
                self.fachada.getImage(url: realUrl).subscribe({ (image) in
                    if i != "" && image.element != nil {
                        self.image.value = image.element!
                    }
                })
                .addDisposableTo(self.disposeBag)
            }, onCompleted: nil, onDisposed: nil)
            .addDisposableTo(disposeBag)
    }
}
