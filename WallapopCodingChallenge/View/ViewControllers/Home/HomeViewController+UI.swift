//
//  HomeViewController+UI.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit

// MARK: - UI internal extension
extension HomeViewController {
    func setupUI() {
        setupContainerView()
        setupSearchBar()
        setupMarvelCharactersTableView()
    }
}

// MARK: - UI private extension
private extension HomeViewController {
    func setupContainerView() {
        containerViewConfiguration()
        view.addSubview(containerView)
        containerView.fillToSuperview()
    }
    
    func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        searchController.searchBar.delegate = self
        
        searchController.searchBar.placeholder = "Search your character"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.becomeFirstResponder()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
    }

    
    func setupMarvelCharactersTableView() {
        marvelCharactersTableViewConfiguration()
        containerView.addSubview(marvelCharactersTableView)
        marvelCharactersTableView.fillToSuperview()
    }
}
