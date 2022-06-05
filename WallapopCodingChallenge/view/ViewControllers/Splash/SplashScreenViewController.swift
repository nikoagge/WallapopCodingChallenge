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
        
        navigate(.init(pageType: .homeViewController, navigationStyle: .setInitialNavigationRootControllers(animated: true)))
    }
}
