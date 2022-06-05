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
    var initialNavigationController: UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        showInitialScreen()
        
        return true
    }
}

// MARK: - Functionality
private extension AppDelegate {
    func showInitialScreen() {
        let splashScreenViewController = StoryboardType.splashScreen.getController(SplashScreenViewController.self)!
        window = UIWindow()
        initialNavigationController = UINavigationController(rootViewController: splashScreenViewController)
        window?.rootViewController = initialNavigationController
        window?.makeKeyAndVisible()
    }
}
