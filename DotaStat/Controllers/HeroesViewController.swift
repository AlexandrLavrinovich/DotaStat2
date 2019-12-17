//
//  ViewController.swift
//  DotaStat
//
//  Created by MacBook Pro on 10.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import SwiftyGif
import Alamofire
import SwiftyJSON

class HeroesViewController: UIViewController {
    
    fileprivate let searchBarHeight: Int = 40

    let logoAnimationView = LogoAnimationView()
    var tabVC = MainTabBarController()
    var heroesCollectionView = HeroesCollectionView()

    @IBOutlet weak var tabBar: UITabBarItem!
    
    var heroes: [HeroesModel] = []
    
    var indicator = UIActivityIndicatorView()

    func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        indicator.style = UIActivityIndicatorView.Style.medium
        indicator.center = self.view.center
        self.view.addSubview(indicator)
    }
    
    override func viewDidLoad() {
//        super.viewDidLoad()
        activityIndicator()
        indicator.startAnimating()
        indicator.backgroundColor = .none
        
        
        APIOpenDota.fetchHeroesData { user in
            self.heroes = user
            self.heroesCollectionView.set(cells: self.heroes)
            DispatchQueue.main.async {
                self.addView()
                self.heroesCollectionView.reloadData()
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
            }
            
        }
    }
    
    func addView() {
        view.addSubview(heroesCollectionView)
//        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width) , height: searchBarHeight))
//        searchBar.backgroundColor = .none
//        searchBar.backgroundImage = .none
//        view.addSubview(searchBar)
//
//        searchBar.snp.makeConstraints{(make) in
//            make.topMargin.equalTo(10)
//            make.leadingMargin.equalToSuperview()
//            make.trailingMargin.equalToSuperview()
//        }
        
        heroesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        heroesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heroesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        heroesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.768627451, blue: 0.7137254902, alpha: 1)
    }

}

//extension HeroesViewController: SwiftyGifDelegate {
//    func gifDidStop(sender: UIImageView) {
//        logoAnimationView.isHidden = true
//    }
//}

