//
//  HomeViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 25/5/22.
//

import UIKit

class HomeViewController: UIViewController, NavigableViewController {
    var containerView = UIView.newViewSetForAutoLayout()
    var notFoundContainerView = UIView.newViewSetForAutoLayout()
    var imageViewNotFound = UIImageView.newViewSetForAutoLayout()
    var labelNotFound = UILabel.newViewSetForAutoLayout()
    var marvelCharactersTableView = UITableView.newViewSetForAutoLayout()
    
    var catalogViewModel: CatalogViewModel!
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let searchController = UISearchController(searchResultsController: nil)
    
    init(with catalogViewModel: CatalogViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.catalogViewModel = catalogViewModel
        fetchCharacters(offset: 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupUI()
    }
}
