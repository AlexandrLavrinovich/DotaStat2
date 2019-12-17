//
//  MyHeroesCollectionView.swift
//  DotaStat
//
//  Created by MacBook Pro on 17.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

//import UIKit
//
//extension HeroesCollectionView: UISearchBarDelegate {
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        isSearching = true
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        isSearching = false
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        isSearching = false
//    }
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        isSearching = false
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredHeroes.removeAll(keepingCapacity: false)
//        let predicateString = searchBar.text!
//        filteredHeroes = cells.filter( { $0.heroName.range(of: predicateString) != nil })
//        filteredHeroes.sort { $0.heroName < $1.heroName}
//        isSearching = (filteredHeroes.count == 0) ? false: true
////        HeroesViewController.heroesCollectionView.reloadData()
//
//    }
//
//}



