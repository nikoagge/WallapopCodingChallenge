//
//  ComicCollectionViewCell.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    static let identifier = "ComicCollectionViewCell"
}
