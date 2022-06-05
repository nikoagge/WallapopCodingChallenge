//
//  FlowStartingPoint.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit
import Moya

final class FlowStartingPoint {
    var navigationController: UINavigationController?
    
    var provider: MoyaProvider<MarvelProvider> =  MoyaProvider<MarvelProvider>()
    
    init(with window: UIWindow) {
        let viewModel = MarvelCharactersListViewModel(with: provider)
        let vc = MarvelCharactersListViewController(with: viewModel)
        navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
