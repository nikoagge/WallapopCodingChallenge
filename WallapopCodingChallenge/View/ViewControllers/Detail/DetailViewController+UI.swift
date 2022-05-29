//
//  DetailViewController+UI.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 29/5/22.
//

import UIKit

// MARK: - UI internal extension
extension DetailViewController {
    func setupUI() {
        setupContainerView()
    }
}

// MARK: - UI private extension
private extension DetailViewController {
    func setupContainerView() {
        containerViewConfiguration()
        view.addSubview(containerView)
        containerView.fillToSuperview()
    }
