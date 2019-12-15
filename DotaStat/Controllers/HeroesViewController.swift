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

    let logoAnimationView = LogoAnimationView()
    private var tabVC = MainTabBarController()
    private var heroesCollectionView = HeroesCollectionView()

    @IBOutlet weak var tabBar: UITabBarItem!
    
    private var heroes = [HeroesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(heroesCollectionView)
        
        heroesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        heroesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        heroesCollectionView.topAnchor.constraint(equalTo: titleLabelBar.bottomAnchor).isActive = true
//        heroesCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        heroesCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        heroesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        APIOpenDota.fetchUsersData { user in
            self.heroes = user
            self.heroesCollectionView.set(cells: self.heroes)
            self.heroesCollectionView.reloadData()
        }
//        
//        view.addSubview(logoAnimationView)
//        logoAnimationView.pinEdgesToSuperView()
//        logoAnimationView.logoGifImageView.delegate = self
//        vc.fetchUsersData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        logoAnimationView.logoGifImageView.startAnimatingGif()
    }

}

//extension HeroesViewController: SwiftyGifDelegate {
//    func gifDidStop(sender: UIImageView) {
//        logoAnimationView.isHidden = true
//    }
//}

