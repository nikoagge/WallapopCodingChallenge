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
        setupMarvelCharacterImageView()
        setupMarvelCharacterNameLabel()
        setupMarvelCharacterDescriptionLabel()
        setupButtonsStackView()
    }
}

// MARK: - UI private extension
private extension DetailViewController {
    func setupContainerView() {
        containerViewConfiguration()
        view.addSubview(containerView)
        containerView.fillToSuperview()
    }
    
    func setupMarvelCharacterImageView() {
        marvelCharacterImageView.contentMode = .scaleAspectFill
        containerView.addSubview(marvelCharacterImageView)
        NSLayoutConstraint.activate([
            marvelCharacterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            marvelCharacterImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            marvelCharacterImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func setupMarvelCharacterNameLabel() {
        marvelCharacterNameLabelConfiguration()
        containerView.addSubview(marvelCharacterNameLabel)
        NSLayoutConstraint.activate([
            marvelCharacterNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 13),
            marvelCharacterNameLabel.topAnchor.constraint(equalTo: marvelCharacterImageView.bottomAnchor, constant: 13),
            marvelCharacterNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13)
        ])
    }
    
    func setupMarvelCharacterDescriptionLabel() {
        marvelCharacterDescriptionLabelConfiguration()
        containerView.addSubview(marvelCharacterDescriptionLabel)
        NSLayoutConstraint.activate([
            marvelCharacterDescriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 13),
            marvelCharacterDescriptionLabel.topAnchor.constraint(equalTo: marvelCharacterNameLabel.bottomAnchor, constant: 13),
            marvelCharacterDescriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13)
        ])
    }
    
    func setupButtonsStackView() {
        buttonsConfiguration()
        buttonsStackViewConfiguration()
        containerView.addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 13),
            buttonsStackView.topAnchor.constraint(equalTo: marvelCharacterDescriptionLabel.bottomAnchor, constant: 13),
            buttonsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -13),
            buttonsStackView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -13),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
