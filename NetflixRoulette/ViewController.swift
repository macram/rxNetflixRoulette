//
//  ViewController.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 18/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    fileprivate let reuseIdentificator = "FilmCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    let viewModel = ViewModel(fachada: Fachada())
    
    lazy   var searchBar:UISearchBar = UISearchBar()
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpSearchBar()
        setUpNavigationBar()
        
        setUpView()
        
        setUpBindings()
    }
    
    func setUpSearchBar() {
        searchBar.placeholder = "Title"
        searchBar.barTintColor = UIColor.red
        navigationItem.titleView = searchBar
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
    }
    
    func setUpView() {
        self.searchBar.becomeFirstResponder()
    }
    
    func setUpBindings() {
        let searchResult = searchBar.rx.value.orEmpty.throttle(1, scheduler: MainScheduler.instance)
        .distinctUntilChanged()
            .flatMapLatest { query -> Observable<Film> in
                print("getfilms \(query)")
                if (query.isEmpty) {
                    return self.viewModel.getFilms(title: "")
                }
                else {
                    return self.viewModel.getFilms(title: query)
                }
                
        }
        .observeOn(MainScheduler.instance)
        
        searchResult.subscribe(onNext: { (film) in
            self.label1.text = film.show_title
            self.label2.text = film.director
            self.label3.text = film.release_year
            self.label4.text = film.summary
        }, onError: { (error) in
            self.label1.text = error.localizedDescription
            self.label2.text = ""
            self.label3.text = ""
            self.label4.text = ""
        } , onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

