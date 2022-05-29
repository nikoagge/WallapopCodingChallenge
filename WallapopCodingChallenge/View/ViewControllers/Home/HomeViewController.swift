//
//  HomeViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 25/5/22.
//

import UIKit

class HomeViewController: UIViewController {
    var containerView = UIView.newViewSetForAutoLayout()
    var stackViewNotFound = UIStackView.newViewSetForAutoLayout()
    var imageViewNotFound = UIImageView.newViewSetForAutoLayout()
    var labelNotFound = UILabel.newViewSetForAutoLayout()
    var marvelCharactersTableView = UITableView.newViewSetForAutoLayout()
    
    var catalogViewModel: CatalogViewModel!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        catalogViewModel = CatalogViewModel(
            marvelService: MarvelService(
                apiConfiguration: APIConfiguration.shared
            )
        )
        
        setupUI()
        fetchCharacters(offset: 0)
    }
}
