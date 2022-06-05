//
//  StoryboardType+Extension.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

enum StoryboardType: String {
    case splashScreen = "SplashScreen"
}

extension StoryboardType {
    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func getController<T: UIViewController>(_ type: T.Type, setup: ((T) -> Void) = { _ in }) -> T? {
        if let viewController = self.getStoryboard().instantiateViewController(withIdentifier: String(describing: T.self)) as? T {
            setup(viewController)
            return viewController
        }
        
        return nil
    }
}
