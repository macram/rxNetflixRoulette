//
//  FIlmsViewController.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 6/9/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilmsViewController: UITableViewController {
    
    lazy   var searchBar:UISearchBar = UISearchBar()
    
    let disposeBag = DisposeBag()
    
    let viewModel = FilmsViewModel(fachada: Fachada())

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpView()
        setUpSearchBar()
        setUpNavigationBar()
        setUpBindings()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.searchBar.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUpSearchBar() {
        searchBar.placeholder = "Actor"
        searchBar.barTintColor = UIColor.red
        navigationItem.titleView = searchBar
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func setUpView() {
        self.searchBar.becomeFirstResponder()
    }

    func setUpBindings() {
        searchBar.rx.value.orEmpty
            .distinctUntilChanged()
            .bindTo(viewModel.actor)
            .addDisposableTo(disposeBag)
        
//        viewModel.film.asDriver().drive(onNext: { (film) in
//            self.label1.text = film.show_title
//            self.label2.text = film.director
//            self.label3.text = film.release_year
//            self.label4.text = film.summary
//        }, onCompleted: nil, onDisposed: nil)
//            .addDisposableTo(disposeBag)
    }
}
