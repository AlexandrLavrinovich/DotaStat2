//
//  APIOpenDota.swift
//  DotaStat
//
//  Created by MacBook Pro on 14.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum APIOpenDota {
    static func fetchHeroesData(completion: @escaping ([HeroesModel]) -> Void) {
        var heroes = [HeroesModel]()
        DispatchQueue.global(qos: .background).async {
            Alamofire
                .request("https://api.opendota.com/api/heroStats")
                .responseJSON(queue: DispatchQueue.global(qos: .background), completionHandler: {(response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    json.array?.forEach( { (hero) in
                        let heroName = hero["localized_name"].string
                        let imageString = hero["img"].string
                        let url1 = "https://api.opendota.com\(imageString!)"
                        let imageUrl = URL(string: url1)!
                        let imageData = try! Data(contentsOf: imageUrl)
                        let image = UIImage(data: imageData)
                        let iconString = hero["icon"].string
                        let url2 = "https://api.opendota.com\(iconString!)"
                        let iconUrl = URL(string: url2)!
                        guard let iconData = try? Data(contentsOf: iconUrl) else { return }
                        let icon = UIImage(data: iconData)
                        var heroRoles: String {
                            var roles = ""
                            hero["roles"].array?.forEach( { (role) in
                                roles += ", " + role.string!
                            })
                            return roles
                        }
                        let baseAttackMin = hero["base_attack_min"].int
                        let baseAttackMax = hero["base_attack_max"].int
                        let baseHealth = hero["base_health"].int
                        let baseMana = hero["base_mana"].int
                        let primaryAttr = hero["primary_attr"].string
                        let attackType = hero["attack_type"].string
                        
//                        heroes.append(HeroesModel(heroName: heroName!, mainImage: image!, iconImage: icon!, heroRoles: heroRoles)!, )
                        heroes.append(HeroesModel(heroName: heroName!, mainImage: image!, iconImage: icon!, heroRoles: heroRoles, heroAttackMin: baseAttackMin!, heroAttackMax: baseAttackMax!, heroHealth: baseHealth!, heroMana: baseMana!, heroAttr: primaryAttr!, heroAttackType: attackType!)!)
                    })
                    
                    DispatchQueue.main.async {
                        heroes.sort { $0.heroName < $1.heroName }
                        completion(heroes)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    static func fetchProfileData(key: String, steamId: String, completion: @escaping(PlayerModel) -> Void) {
//        var playerPlace = [PlayerModel]()
        DispatchQueue.global(qos: .background).async {
            Alamofire
            .request("https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/?key=\(key)&steamids=\(steamId)")
                .responseJSON(queue: DispatchQueue.global(qos: .background), completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let data = json["response"]
                        let player = data["players"]
                        player.array?.forEach( { (step) in
                            let playerName = step["personaname"].string
                            let avatarUrl = step["avatarfull"].string
                            let imageUrl = URL(string: avatarUrl!)!
                            let imageData = try! Data(contentsOf: imageUrl)
                            let image = UIImage(data: imageData)
                            guard let timeCreated = step["timecreated"].int64 else { return }
                            let lastLog = step["lastlogoff"].int64
                            let playerPlace = (PlayerModel(playerName: playerName!, mainImage: image!, createDate: timeCreated, lastLog: lastLog!)!)
                            DispatchQueue.main.async {
                                completion(playerPlace)
                            }
                            
                        })
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }

                })
        }
        
    }
    
    static func fetchFriendsList(key: String, steamId: String, completion: @escaping([String]) -> Void) {
        var friendList = [String]()
        DispatchQueue.global(qos: .background).async {
            Alamofire
            .request("https://api.steampowered.com/ISteamUser/GetFriendList/v1/?key=\(key)&steamid=\(steamId)")
                .responseJSON(queue: DispatchQueue.global(qos: .background), completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let data = json["friendslist"]
                        let player = data["friends"]
                        player.array?.forEach( { (step) in
                            let friendId = step["steamid"].string
                            friendList.append(friendId!)
                        })
                        DispatchQueue.main.async {
                            completion(friendList)
                        }
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }

                })
        }
    }
    
    
}
