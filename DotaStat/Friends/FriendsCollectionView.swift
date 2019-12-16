//
//  HeroesCollectionView.swift
//  DotaStat
//
//  Created by MacBook Pro on 14.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit

class FriendsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [PlayerModel]()
    

     init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = #colorLiteral(red: 0.1803921569, green: 0.768627451, blue: 0.7137254902, alpha: 0.85)
        delegate = self
        dataSource = self
        register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: FriendsCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        
    }
    
    func set(cells: [PlayerModel]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FriendsCollectionViewCell.reuseId, for: indexPath) as! FriendsCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.nameLabel.text = cells[indexPath.row].playerName
        cell.smallDescriptionLabel.text = cells[indexPath.row].createDate
//        cell.smallDescriptionLabel.text = cells[indexPath.row].smallDescription
//        cell.costLabel.text = "$\(cells[indexPath.row].cost)"
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height * 0.8)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
