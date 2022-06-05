//
//  UIView+Extension.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit

extension UIView {
    static func newViewSetForAutoLayout() -> Self {
        let view: UIView = Self()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view as! Self
    }
    
    func fillToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left),
            topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: insets.right),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: insets.bottom)
        ])
    }
    
    func showActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        activityIndicator.color = .white
        self.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    public func setBlackBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
