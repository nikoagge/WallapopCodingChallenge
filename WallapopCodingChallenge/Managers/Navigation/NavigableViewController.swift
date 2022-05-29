//
//  NavigableViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 29/5/22.
//

import UIKit

protocol NavigableViewController where Self: UIViewController {
    func navigate(_ navigationItem: NavigationItem)
    func push(_ pageType: NavigationItem.PageType)
}

extension NavigableViewController {
    func navigate(_ navigationItem: NavigationItem) {
        var controllersToInitialNavigation: [UIViewController] = []
        var controllerToNavigate: UIViewController!

        switch navigationItem.pageType {
        case .viewControllers(let viewControllers): controllersToInitialNavigation = viewControllers
        case .viewController(let viewController): controllerToNavigate = viewController
        case .detailViewController: controllerToNavigate = DetailViewController()
        }

        if let controllerToNavigate = controllerToNavigate {
            controllersToInitialNavigation.append(controllerToNavigate)
        }

        DispatchQueue.main.async {
            switch navigationItem.navigationStyle {
            case .present(let animated):
                controllerToNavigate.modalPresentationStyle = .overFullScreen
                self.present(controllerToNavigate, animated: animated)

            case .presentWithinNavigation(let animated, let hidesBottomBar):
                controllerToNavigate.tabBarController?.hidesBottomBarWhenPushed = hidesBottomBar
                let navigationController = UINavigationController(rootViewController: controllerToNavigate)
                navigationController.isNavigationBarHidden = true
                self.present(navigationController, animated: animated)

            case .push(let animated):
                self.navigationController?.pushViewController(controllerToNavigate, animated: animated)

            case .replace(let animated):
                if var viewControllers = self.navigationController?.viewControllers {
                    viewControllers.removeLast()
                    viewControllers.append(controllerToNavigate)
                    self.navigationController?.setViewControllers(viewControllers, animated: animated)
                }
            }
        }
    }

    func push(_ pageType: NavigationItem.PageType) {
        navigate(NavigationItem(pageType: pageType, navigationStyle: .push(animated: true)))
    }
}
