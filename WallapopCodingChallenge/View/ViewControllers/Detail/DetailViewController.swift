//
//  DetailViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 29/5/22.
//

import UIKit

class DetailViewController: UIViewController {
    var containerView = UIView.newViewSetForAutoLayout()
    var marvelCharacterImageView = UIImageView.newViewSetForAutoLayout()
    var marvelCharacterNameLabel = UILabel.newViewSetForAutoLayout()
    var marvelCharacterDescriptionLabel = UILabel.newViewSetForAutoLayout()
    var buttonsStackView = UIStackView.newViewSetForAutoLayout()
    var detailButton = UIButton.newViewSetForAutoLayout()
    var wikiButton = UIButton.newViewSetForAutoLayout()
    var comicsButton = UIButton.newViewSetForAutoLayout()
    
    var catalogDetailViewModel: CatalogDetailViewModel!

    init(with catalogDetailViewModel: CatalogDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        
        self.catalogDetailViewModel = catalogDetailViewModel
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
