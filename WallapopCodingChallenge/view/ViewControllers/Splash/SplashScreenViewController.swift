//
//  SplashScreenViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

class SplashScreenViewController: UIViewController, NavigableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let characterViewModel = CharacterViewModel()
        NetworkService.shared.alamofireWrapper = AlamofireWrapper()
        characterViewModel.networkService = NetworkService.shared
        navigate(.init(pageType: .charactersListViewController(characterViewModel: characterViewModel), navigationStyle: .setInitialNavigationRootControllers(animated: true)))
    }
}
