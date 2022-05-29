//
//  AppDelegate.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 25/5/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        showHomeViewController()
        
        return true
    }
}

// MARK: - Functionality
private extension AppDelegate {
    func showHomeViewController() {
        window = UIWindow()
        let homeViewController = HomeViewController(with: CatalogViewModel(
            marvelService: MarvelService(
                apiConfiguration: APIConfiguration.shared
            )
        ))
        window?.rootViewController = UINavigationController(rootViewController: homeViewController)
        window?.makeKeyAndVisible()
    }
}
