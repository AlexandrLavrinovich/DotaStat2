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
//    var smallDescription: String?
//    var cost: Int?
    
    init?(heroName: String, mainImage: UIImage, iconImage: UIImage, heroRoles: String) {
        self.heroName = "Name: \(heroName)"
        self.heroRoles = "Roles: \(heroRoles)"
        self.mainImage = mainImage
        self.iconImage = iconImage
    }
}


//
//struct HeroesModel {
//    var mainImage: UIImage
//    var sushiName: String
//    var smallDescription: String
//    var cost: Int
//
//    static func fetchSushi() -> [HeroesModel] {
//        let firstItem = HeroesModel(mainImage: UIImage(named: "sushi1")!,
//                               sushiName: "Jengibre",
//                               smallDescription: "Original Japanese",
//                               cost: 8)
//        let secondItem = SushiModel(mainImage: UIImage(named: "sushi2")!,
//                                    sushiName: "Caviar",
//                                    smallDescription: "Original Japanese",
//                                    cost: 10)
//        let thirdItem = SushiModel(mainImage: UIImage(named: "sushi3")!,
//                                   sushiName: "Camaron",
//                                   smallDescription: "Original Japanese",
//                                   cost: 7)
//
//        let fouthItem = SushiModel(mainImage: UIImage(named: "sushi4")!,
//                                   sushiName: "Salmon",
//                                   smallDescription: "Original Japanese",
//                                   cost: 12)
//
//        let five = SushiModel(mainImage: UIImage(named: "sushi1")!,
//                                   sushiName: "Jengibre",
//                                   smallDescription: "Original Japanese",
//                                   cost: 8)
//        let six = SushiModel(mainImage: UIImage(named: "sushi2")!,
//                                    sushiName: "Caviar",
//                                    smallDescription: "Original Japanese",
//                                    cost: 10)
//        let seven = SushiModel(mainImage: UIImage(named: "sushi3")!,
//                                   sushiName: "Camaron",
//                                   smallDescription: "Original Japanese",
//                                   cost: 7)
//
//        let eight = SushiModel(mainImage: UIImage(named: "sushi4")!,
//                                   sushiName: "Salmon",
//                                   smallDescription: "Original Japanese",
//                                   cost: 12)
//
//
//        return [firstItem]
//    }
//}

struct Constants {
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.galleryMinimumLineSpacing / 2)) / 1
}
