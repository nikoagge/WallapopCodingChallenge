//
//  CharacterCollectionViewCell.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    
    static let identifier = "CharacterCollectionViewCell"
}
