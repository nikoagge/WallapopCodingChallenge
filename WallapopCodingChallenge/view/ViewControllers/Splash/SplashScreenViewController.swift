//
//  SplashScreenViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit
import Moya

class SplashScreenViewController: UIViewController {
    var provider: MoyaProvider<MarvelProvider> =  MoyaProvider<MarvelProvider>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
