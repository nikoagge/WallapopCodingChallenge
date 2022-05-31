//
//  HomeViewController+Configuration+Functionality.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit

// MARK: Configuration & Functionality
extension HomeViewController {
    func containerViewConfiguration() {
        containerView.backgroundColor = .white
    }
    
    func marvelCharactersTableViewConfiguration() {
        marvelCharactersTableView.dataSource = self
        marvelCharactersTableView.delegate = self
        marvelCharactersTableView.register(CatalogTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.identifier)
    }
    
    func fetchCharacters(offset: Int, name: String? = nil) {
        view.showActivityIndicator(self.activityIndicator)
        activityIndicator.startAnimating()
        catalogViewModel.fetchMarvelCharacters(offset: offset, name: name) {
            self.view.hideActivityIndicator(self.activityIndicator)
            self.hideNotFoundMessage()
            self.marvelCharactersTableView.reloadData()
        }
    }
    
    func hideNotFoundMessage() {
        imageViewNotFound.alpha = 0
        labelNotFound.alpha = 0
    }
    
    func showNotFoundMessage() {
        UIView.animate(withDuration: 0.7, animations: {
            self.imageViewNotFound.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.7) {
                self.labelNotFound.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func stackViewNotFoundConfiguration() {
        stackViewNotFound.axis = .vertical
        stackViewNotFound.alignment = .fill
        stackViewNotFound.distribution = .fill
        stackViewNotFound.spacing = 8
    }
    
    func imageViewNotFoundConfiguration() {
        imageViewNotFound.image = UIImage(named: "sad")
        imageViewNotFound.contentMode = .scaleAspectFit
    }
    
    func labelNotFoundConfiguration() {
        labelNotFound.text = "Can't find characters with your terms."
        labelNotFound.textColor = .labelNotFoundTextColor
        labelNotFound.font = .makeSystem(22, .regular)
        labelNotFound.textAlignment = .center
        labelNotFound.numberOfLines = 0
        labelNotFound.lineBreakMode = .byWordWrapping
    }
}
