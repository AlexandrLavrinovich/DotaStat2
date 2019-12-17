//
//  HeroesCollectionView.swift
//  DotaStat
//
//  Created by MacBook Pro on 14.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class HeroesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells: [HeroesModel] = []
//    var filteredHeroes: [HeroesModel] = []
//    var isSearching: Bool = false
    

     init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.768627451, blue: 0.7137254902, alpha: 1)
        delegate = self
        dataSource = self
        register(HeroesCollectionViewCell.self, forCellWithReuseIdentifier: HeroesCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        
    }
    
    func set(cells: [HeroesModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if isSearching {
//            return filteredHeroes.count
//        }
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: HeroesCollectionViewCell.reuseId, for: indexPath) as! HeroesCollectionViewCell
        
//        if isSearching {
//            cell.mainImageView.image = filteredHeroes[indexPath.row].mainImage
//            cell.nameLabel.text = filteredHeroes[indexPath.row].heroName
//            cell.iconImageView.image = filteredHeroes[indexPath.row].iconImage
//            cell.heroRolesLabel.text = filteredHeroes[indexPath.row].heroRoles
//            cell.heroHealthLabel.text = filteredHeroes[indexPath.row].heroHealth
//            cell.heroManaLabel.text = filteredHeroes[indexPath.row].heroMana
//            cell.heroAttackLabel.text = filteredHeroes[indexPath.row].heroAttack
//            cell.heroAttackTypeLabel.text = filteredHeroes[indexPath.row].heroAttackType
//            cell.heroAttr.text = filteredHeroes[indexPath.row].heroAttr
//        } else {
            cell.mainImageView.image = cells[indexPath.row].mainImage
            cell.nameLabel.text = cells[indexPath.row].heroName
            cell.iconImageView.image = cells[indexPath.row].iconImage
            cell.heroRolesLabel.text = cells[indexPath.row].heroRoles
            cell.heroHealthLabel.text = cells[indexPath.row].heroHealth
            cell.heroManaLabel.text = cells[indexPath.row].heroMana
            cell.heroAttackLabel.text = cells[indexPath.row].heroAttack
            cell.heroAttackTypeLabel.text = cells[indexPath.row].heroAttackType
            cell.heroAttr.text = cells[indexPath.row].heroAttr
//        }

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.2)
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.8)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
