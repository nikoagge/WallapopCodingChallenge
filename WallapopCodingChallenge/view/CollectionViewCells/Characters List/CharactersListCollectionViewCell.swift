//
//  CharactersListCollectionViewCell.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

class CharactersListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    
    static let identifier = "CharactersListCollectionViewCell"
}
