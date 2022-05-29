//
//  DetailViewController+Configuration+Functionality.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 29/5/22.
//

import UIKit

// MARK: Configuration & Functionality
extension DetailViewController {
    func containerViewConfiguration() {
        containerView.backgroundColor = .white
    }
    
    func marvelCharacterNameLabelConfiguration() {
        marvelCharacterNameLabel.text = "Character name"
        marvelCharacterNameLabel.textColor = .black
        marvelCharacterNameLabel.font = .systemFont(ofSize: 17)
    }
    
    func marvelCharacterDescriptionLabelConfiguration() {
        marvelCharacterDescriptionLabel.text = "Character description"
        marvelCharacterDescriptionLabel.textColor = .black
        marvelCharacterDescriptionLabel.font = .systemFont(ofSize: 17)
    }
    
    func buttonsConfiguration() {
        detailButton.setTitle("Detail", for: .normal)
        wikiButton.setTitle("Wiki", for: .normal)
        comicsButton.setTitle("Comics", for: .normal)
        buttonsStackView.addArrangedSubview(detailButton)
        buttonsStackView.addArrangedSubview(wikiButton)
        buttonsStackView.addArrangedSubview(comicsButton)
        let _ = buttonsStackView.subviews.compactMap { $0 as? UIButton }.map {
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
            $0.backgroundColor = .orange
        }
    }
    
    func buttonsStackViewConfiguration() {
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 4
    }
}
