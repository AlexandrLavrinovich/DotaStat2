//
//  SteamAuthViewController.swift
//  DotaStat
//
//  Created by MacBook Pro on 16.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import SteamLogin
import SnapKit

class SteamAuthViewController: UIViewController {
    var steamUser: SteamUser? = nil
    var playerUser: PlayerModel? = nil
    var friends = [String]()
    var friendsModels = [PlayerModel]()
    
    private var friendsCollectionView = FriendsCollectionView()
     
    override func viewDidAppear(_ animated: Bool) {
        SteamLogin.steamApiKey = "160A1E87653E30D9562DE9E5A47386E5"
        self.steamUser = SteamUser.load()
        if steamUser == nil {
            SteamLoginVC.login(from: self) { [weak self] (user, error) in
                guard let self = self else { return }
                if let user = user {
                    self.steamUser = user
                    self.steamUser?.save()
                    self.perform(#selector(self.showSuccessAlert), with: nil, afterDelay: 1)
                    self.viewDidLoad()
                } else {
                    self.showErrorAlert(error)
                }
            }

        } else {
        }
        view.backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.768627451, blue: 0.7137254902, alpha: 1)
    }
    
    override func viewDidLoad() {
        SteamLogin.steamApiKey = "160A1E87653E30D9562DE9E5A47386E5"
        self.steamUser = SteamUser.load()
        guard steamUser != nil else { return }
        APIOpenDota.fetchProfileData(key: SteamLogin.steamApiKey, steamId: self.steamUser!.steamID64!) { player in
                    self.playerUser = player
            DispatchQueue.main.async {
                self.addMainView()
            }
                
            self.addFriendsList()
        }
    }
    
    func addMainView() {
        let mainView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.0862745098, blue: 0.1529411765, alpha: 1)
            view.layer.cornerRadius = 20
            return view
        }()
        
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.topMargin.left.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottomMargin.equalTo(-250)
            
        }
        
        let mainImageView: UIImageView = {
            let image = UIImageView()
            image.image = self.playerUser?.mainImage
            image.backgroundColor = .none
            image.layer.cornerRadius = 30
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        mainView.addSubview(mainImageView)
        
        mainImageView.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(10)
            make.trailingMargin.equalTo(-10)
            make.topMargin.equalTo(10)
            make.height.equalToSuperview().dividedBy(1.7)
        }
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
            label.numberOfLines = 2
            label.text = self.playerUser?.playerName
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        mainView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(10)
            make.trailingMargin.equalTo(20)
            make.top.equalTo(mainImageView.snp.bottomMargin).inset(-20)
            make.height.equalTo(30)
        }
        
        let dateLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
            label.numberOfLines = 2
            label.text = self.playerUser?.createDate
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        mainView.addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(10)
            make.trailingMargin.equalTo(20)
            make.top.equalTo(nameLabel.snp.bottomMargin).inset(-20)
            make.height.equalTo(30)
        }
        
        let lastSign: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
            label.numberOfLines = 2
            label.text = self.playerUser?.lastLog
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        mainView.addSubview(lastSign)
        
        lastSign.snp.makeConstraints { (make) in
            make.leadingMargin.equalTo(10)
            make.trailingMargin.equalTo(20)
            make.top.equalTo(dateLabel.snp.bottomMargin).inset(-20)
            make.height.equalTo(30)
        }
        
        view.addSubview(self.friendsCollectionView)
        
        self.friendsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(mainView.snp.bottomMargin).inset(-20)
            make.leadingMargin.equalTo(-10)
            make.trailingMargin.equalTo(10)
            make.bottomMargin.equalTo(-10)
            
        }
        
    }
    
    func addFriendsList() {
        APIOpenDota.fetchFriendsList(key: SteamLogin.steamApiKey, steamId: steamUser!.steamID64!) {  friend in
            self.friends = friend
            
            for eachFriendId in self.friends {
                APIOpenDota.fetchProfileData(key: SteamLogin.steamApiKey, steamId: eachFriendId) { friendPlayer in
                    self.friendsModels.append(friendPlayer)
                    self.friendsCollectionView.set(cells: self.friendsModels)
                    DispatchQueue.main.async {
                        self.friendsCollectionView.reloadData()
                    }
                }
            }
        }
    }
    
    
    @objc func showSuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "Welcome \(steamUser?.steamVanityID ?? "").\n  Your steamID32 is : \(steamUser?.steamID32 ?? ""). \n Your steamID64 is : \(steamUser?.steamID64 ?? "").", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(_ error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
