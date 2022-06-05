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
        setupStackViewNotFoundContainerView()
        setupImageViewNotFound()
        setupLabelNotFound()
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
    
    func setupStackViewNotFoundContainerView() {
        marvelCharactersTableView.addSubview(notFoundContainerView)
        NSLayoutConstraint.activate([
            notFoundContainerView.leadingAnchor.constraint(equalTo: marvelCharactersTableView.leadingAnchor, constant: 13),
            notFoundContainerView.topAnchor.constraint(equalTo: marvelCharactersTableView.topAnchor, constant: 13),
            notFoundContainerView.trailingAnchor.constraint(equalTo: marvelCharactersTableView.trailingAnchor, constant: -13),
            notFoundContainerView.bottomAnchor.constraint(equalTo: marvelCharactersTableView.bottomAnchor, constant: -13)
        ])
    }
    
    func setupImageViewNotFound() {
        imageViewNotFoundConfiguration()
        notFoundContainerView.addSubview(imageViewNotFound)
        NSLayoutConstraint.activate([
            imageViewNotFound.heightAnchor.constraint(equalToConstant: 110),
            imageViewNotFound.widthAnchor.constraint(equalToConstant: 85),
            imageViewNotFound.centerXAnchor.constraint(equalTo: notFoundContainerView.centerXAnchor),
            imageViewNotFound.centerYAnchor.constraint(equalTo: notFoundContainerView.centerYAnchor)
        ])
    }
    
    func setupLabelNotFound() {
        labelNotFoundConfiguration()
        notFoundContainerView.addSubview(labelNotFound)
        NSLayoutConstraint.activate([
            labelNotFound.leadingAnchor.constraint(equalTo: notFoundContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 13),
            labelNotFound.topAnchor.constraint(equalTo: imageViewNotFound.bottomAnchor, constant: 13),
            labelNotFound.trailingAnchor.constraint(equalTo: notFoundContainerView.safeAreaLayoutGuide.trailingAnchor, constant: -13),
            labelNotFound.bottomAnchor.constraint(equalTo: notFoundContainerView.bottomAnchor, constant: -13)
        ])
    }
}
