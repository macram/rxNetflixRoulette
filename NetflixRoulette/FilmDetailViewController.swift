//
//  FilmDetailViewController.swift
//  NetflixRoulette
//
//  Created by Manu Mateos on 8/9/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FilmDetailViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    let disposeBag = DisposeBag()
    
    var viewModel = FilmsDetailViewModel(fachada: Fachada())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpBindings() {
        viewModel.image.asObservable().bindTo(image.rx.image).addDisposableTo(disposeBag)
    }

}
