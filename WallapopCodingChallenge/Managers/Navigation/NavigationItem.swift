//
//  NavigationItem.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 29/5/22.
//

import UIKit

/// Contains the navigation style like present/push and the pageType from the available pages/viewControllers
struct NavigationItem {
    enum PageType {
        case viewControllers(viewControllers: [UIViewController])
        case viewController(viewController: UIViewController)
        case splashScreen
        case homeViewController
        case detailViewController(catalogDetailViewModel: CatalogDetailViewModel)
    }

    enum NavigationStyle {
        case present(animated: Bool)
        case presentWithinNavigation(animated: Bool, hidesBottomBar: Bool)
        case push(animated: Bool)
        case replace(animated: Bool)
        case setInitialNavigationRootControllers(animated: Bool)
    }

    let pageType: PageType
    let navigationStyle: NavigationStyle
}
