//
//  UIFont+Extension.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 29/5/22.
//

import UIKit

extension UIFont {
    static func makeSystem(_ fontSize: CGFloat, _ weight: Weight) -> UIFont {
        return UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
}
