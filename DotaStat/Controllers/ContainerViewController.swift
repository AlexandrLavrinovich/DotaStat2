//
//  ContainerViewController.swift
//  DotaStat
//
//  Created by MacBook Pro on 15.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, HeroesViewControllerDelegate {
    
    var controller: UIViewController!
    var menuViewController: UIViewController!
    var isMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureHeroesViewController()
    }

    func configureHeroesViewController() {
        let heroesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! HeroesViewController
        heroesViewController.delegate = self
        controller = heroesViewController
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            print("Добавили mainViewController")
        }
    }
    
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            // показываем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
            }) { (finished) in
                
            }
        } else {
            // убираем menu
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.controller.view.frame.origin.x = 0
            }) { (finished) in
                
            }
        }
    }
    
    // MARK: HeroesViewControllerDelegate
    
    func toggleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
    }

}
