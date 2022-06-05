//
//  HomeViewController+UISearchControllerDelegate+UISearchBarDelegate+UISearchResultsUpdating.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit

//extension HomeViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//    }
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if let name = searchBar.text {
//            hideNotFoundMessage()
//            view.showActivityIndicator(activityIndicator)
//            catalogViewModel.fetchMarvelCharactersByName(name: name) {
//                self.marvelCharactersTableView.reloadData()
//                self.view.hideActivityIndicator(self.activityIndicator)
//                
//                if self.catalogViewModel.numberOfItems() == 0 {
//                    self.showNotFoundMessage()
//                }
//            }
//        }
//    }
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        if !searchBar.text!.isEmpty {
//            searchBar.text = ""
//        }
//        self.hideNotFoundMessage()
//        self.fetchCharacters(offset: 0)
//    }
//}
