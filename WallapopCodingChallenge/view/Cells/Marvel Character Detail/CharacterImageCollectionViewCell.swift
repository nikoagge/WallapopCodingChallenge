//
//  CharacterImageCollectionViewCell.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

class CharacterImageCollectionViewCell: UICollectionViewCell {
    private lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.sizeToFit()
        image.clipsToBounds = true
        
        return image
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageTask?.cancel()
        imageTask = nil
        characterImage.image = nil
    }
    
    private var imageTask: URLSessionTask?
    static var identifier = "CharacterImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setView()
    }
    
    func setView() {
        addSubview(characterImage)
        setCharacterImageConstraints()
    }
    
    func setupCell(with character: Character) {
        imageTask = characterImage.loadImage(with: character.thumbnail, size: .detail)
    }
    
    func setCharacterImageConstraints() {
        characterImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        characterImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        characterImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        characterImage.widthAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        characterImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
