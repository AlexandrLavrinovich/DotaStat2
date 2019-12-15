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
    static func fetchUsersData(completion: @escaping ([HeroesModel]) -> Void) {
        var heroes = [HeroesModel]()
        DispatchQueue.main.async {
            Alamofire.request("https://api.opendota.com/api/heroStats").responseJSON(completionHandler: {(response) in
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
                        heroes.append(HeroesModel(heroName: heroName!, mainImage: image!, iconImage: icon!, heroRoles: heroRoles)!)
                        
                    })
                    heroes.sort { $0.heroName < $1.heroName }
                    DispatchQueue.main.async{
                        completion(heroes)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
            
        }
    }
    
    
}
