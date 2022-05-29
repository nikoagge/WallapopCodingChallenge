//
//  CatalogTableViewCell.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    static let identifier = "CatalogTableViewCell"
    
    private var marvelCharacterNameLabel = UILabel.newViewSetForAutoLayout()
    private var marvelCharacterImageView = UIImageView.newViewSetForAutoLayout()
    
    var catalogTableViewCellViewModel: CatalogTableViewCellViewModel! {
        didSet {
            marvelCharacterNameLabel.text = catalogTableViewCellViewModel.marvelCharacterName
            marvelCharacterImageView.download(from: self.catalogTableViewCellViewModel.thumbnailURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        marvelCharacterNameLabel.text = ""
        marvelCharacterImageView.image = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
private extension CatalogTableViewCell {
    func setupUI() {
        contentView.backgroundColor = .white
        setupMarvelCharacterNameLabel()
        setupMarvelCharacterImageView()
    }
    
    func setupMarvelCharacterNameLabel() {
        contentView.addSubview(marvelCharacterNameLabel)
        NSLayoutConstraint.activate([
            marvelCharacterNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            marvelCharacterNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            marvelCharacterNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13)
        ])
    }
    
    func setupMarvelCharacterImageView() {
        marvelCharacterImageView.contentMode = .scaleToFill
        contentView.addSubview(marvelCharacterImageView)
        NSLayoutConstraint.activate([
            marvelCharacterImageView.leadingAnchor.constraint(greaterThanOrEqualTo: marvelCharacterNameLabel.trailingAnchor, constant: 13),
            marvelCharacterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            marvelCharacterImageView.widthAnchor.constraint(equalToConstant: 60),
            marvelCharacterImageView.heightAnchor.constraint(equalToConstant: 60),
            marvelCharacterImageView.centerYAnchor.constraint(equalTo: marvelCharacterNameLabel.centerYAnchor)
        ])
    }
}
