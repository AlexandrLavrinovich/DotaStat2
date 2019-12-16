//
//  PlayerModel.swift
//  DotaStat
//
//  Created by MacBook Pro on 16.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import UIKit

class PlayerModel {
    
    static var shared = [PlayerModel]()
    
    var mainImage: UIImage
    var playerName: String
    var createDate: String
    var lastLog: String
//    var smallDescription: String?
//    var cost: Int?
    
    init?(playerName: String, mainImage: UIImage, createDate: Int64, lastLog: Int64) {
        self.playerName = "Name: \(playerName)"
        self.mainImage = mainImage
        let createAccount = Date(timeIntervalSince1970: TimeInterval(createDate))
        let lastLogOut = Date(timeIntervalSince1970: TimeInterval(lastLog))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        self.createDate = "Created Date: \(dateFormatter.string(from: createAccount))"
        self.lastLog = "Logoff: \(dateFormatter.string(from: lastLogOut))"
    }
}

struct ConstantsFriend {
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 40
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - ConstantsFriend.leftDistanceToView - ConstantsFriend.rightDistanceToView - (ConstantsFriend.galleryMinimumLineSpacing / 1)) / 3
}
