//
//  NSAttributedString+Extension.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

extension NSAttributedString {
    class func fromString(string: String, lineHeightMultiple: CGFloat) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttributes([
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.baselineOffset: -1],
                                       range: NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
}
