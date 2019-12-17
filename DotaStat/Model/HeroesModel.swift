//
//  HeroesModel.swift
//  DotaStat
//
//  Created by MacBook Pro on 14.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import UIKit

class HeroesModel {
    
    static var shared = [HeroesModel]()
    
    var mainImage: UIImage
    var iconImage: UIImage
    var heroName: String
    var heroRoles: String
    var heroAttack: String
    var heroHealth: String
    var heroMana: String
    var heroAttr: String
    var heroAttackType: String
    
//    var smallDescription: String?
//    var cost: Int?
    
    init?(heroName: String, mainImage: UIImage, iconImage: UIImage, heroRoles: String, heroAttackMin: Int, heroAttackMax: Int, heroHealth: Int, heroMana: Int, heroAttr: String, heroAttackType: String) {
        self.heroName = "\(heroName)"
        self.heroRoles = "Roles: \(heroRoles)"
        self.mainImage = mainImage
        self.iconImage = iconImage
        self.heroAttack = "Attack: \(heroAttackMin) - \(heroAttackMax)"
        self.heroHealth = "Health: \(heroHealth)"
        self.heroMana = "Mana: \(heroMana)"
        self.heroAttr = "Attribute: \(heroAttr)"
        self.heroAttackType = "Attack Type: \(heroAttackType)"
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 1
}
