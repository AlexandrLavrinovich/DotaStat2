//
//  SceneDelegate.swift
//  DotaStat
//
//  Created by MacBook Pro on 10.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let secondVC = HeroesViewController()
        let firstVC = SteamAuthViewController()
//        let thirdVC = ChartViewController()
        
        let f1 = UITabBarItem(title: "Profile", image: UIImage(named: "account"), tag: 0)
        let f2 = UITabBarItem(title: "Heroes", image: UIImage(named: "trending"), tag: 1)
//        f1.setTitleTextAttributes(UIFont(name: "", size: <#T##CGFloat#>), for: <#T##UIControl.State#>)
        
//        let f3 = UITabBarItem(title: "third", image: nil, tag: 2)
        
        firstVC.tabBarItem = f1
        secondVC.tabBarItem = f2
//        thirdVC.tabBarItem = f3
        
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.backgroundColor = #colorLiteral(red: 0.6232550761, green: 0.07247612155, blue: 0.1016658467, alpha: 1)
        tabBarVC.setViewControllers([firstVC, secondVC], animated: true)
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 2.1
        
        let launchVC = LaunchViewController()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = tabBarVC
            window.rootViewController = launchVC
            UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
            { completed in
                window.rootViewController = tabBarVC
                // maybe do something on completion here
            })
            self.window = window
            window.makeKeyAndVisible()
        }
    }


    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

