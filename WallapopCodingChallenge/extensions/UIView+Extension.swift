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
    
    
    func setupRoundedCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func setupBorder(width: CGFloat = 1.0, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func makeItCircular() {
        layoutIfNeeded()
        setupRoundedCorners(radius: min(frame.size.height, frame.size.width) / 2)
    }
    
    func bindFrameToSuperviewBounds() {
        guard let superview = self.superview else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraintsToFit(view: self)
    }
    
    func addConstraintsToFit(view: UIView) {
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                 options: NSLayoutConstraint.FormatOptions(),
                                                                 metrics: nil,
                                                                 views: ["view": view])
        addConstraints(verticalConstraints)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: NSLayoutConstraint.FormatOptions(),
                                                                   metrics: nil,
                                                                   views: ["view": view])
        addConstraints(horizontalConstraints)
    }
}
