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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.searchBar.resignFirstResponder()
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
        searchBar.rx.value.orEmpty
            .distinctUntilChanged()
            .bindTo(viewModel.title)
            .addDisposableTo(disposeBag)
        
        viewModel.film.asDriver().drive(onNext: { (film) in
            self.label1.text = film.title
            self.label2.text = film.original_title
            self.label3.text = film.release_date
            self.label4.text = film.overview
        }, onCompleted: nil, onDisposed: nil)
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

