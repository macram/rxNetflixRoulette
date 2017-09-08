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
import RxDataSources

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
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfFilms>()
        
        dataSource.configureCell = { (ds: TableViewSectionedDataSource<SectionOfFilms>, tv: UITableView, ip: IndexPath, item: Film) in
            let cell = tv.dequeueReusableCell(withIdentifier: "Cell", for: ip)
            cell.textLabel?.text = "\(item.show_title!)"
            cell.detailTextLabel?.text = "Dirigida por \(item.director!), año \(item.release_year!)"
            return cell
        }
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].header
        }
        
        tableView.delegate = self
        tableView.dataSource = nil
        
        viewModel.obsFilms!.asObservable()
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "FilmDetailFromActor" else {
            return
        }
        
        let destinationView = segue.destination as! FilmDetailViewController
        let _ = destinationView.view
        let film = viewModel.films.value[tableView.indexPathForSelectedRow!.row]
        
        destinationView.label1.text = film.show_title!
        destinationView.label2.text = film.director!
        destinationView.label3.text = film.show_cast!
        destinationView.label4.text = film.release_year!
        destinationView.label5.text = film.summary!
    }
    
}
