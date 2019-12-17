//
//  HeroesCollectionViewCell.swift
//  DotaStat
//
//  Created by MacBook Pro on 14.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class HeroesCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "HeroesCollectionViewCell"
    
    let mainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let heroRolesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroHealthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroManaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttackLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttackTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroAttr: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 0.6235294118, blue: 0.1098039216, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
//    let costLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 24, weight: .light)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(mainImageView)
        addSubview(nameLabel)
        addSubview(heroRolesLabel)
        addSubview(iconImageView)
        addSubview(heroHealthLabel)
        addSubview(heroManaLabel)
        addSubview(heroAttackLabel)
        addSubview(heroAttackTypeLabel)
        addSubview(heroAttr)
        
        backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.0862745098, blue: 0.1529411765, alpha: 1)
        
        
        // mainImageView constraints
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3).isActive = true
        
        // nameLabel constraints
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: mainImageView.topAnchor, constant: 10).isActive = true
        
        // heroRolesLabel constraints
        heroRolesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroRolesLabel.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 8).isActive = true
        heroRolesLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // iconImageView constraints
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        iconImageView.topAnchor.constraint(equalTo: heroRolesLabel.bottomAnchor, constant: 10).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // heroHealthLabel constraints
        heroHealthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroHealthLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8).isActive = true
        heroHealthLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // heroManaLabel constraints
        heroManaLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroManaLabel.topAnchor.constraint(equalTo: heroHealthLabel.bottomAnchor, constant: 8).isActive = true
        heroManaLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // heroAttackLabel constraints
        heroAttackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroAttackLabel.topAnchor.constraint(equalTo: heroManaLabel.bottomAnchor, constant: 8).isActive = true
        heroAttackLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // heroAttackTypeLabel constraints
        heroAttackTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroAttackTypeLabel.topAnchor.constraint(equalTo: heroAttackLabel.bottomAnchor, constant: 8).isActive = true
        heroAttackTypeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // heroAttr constraints
        heroAttr.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        heroAttr.topAnchor.constraint(equalTo: heroAttackTypeLabel.bottomAnchor, constant: 8).isActive = true
        heroAttr.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2, constant: 10).isActive = true
        
        // costLabel constraints
//        costLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
//        costLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
