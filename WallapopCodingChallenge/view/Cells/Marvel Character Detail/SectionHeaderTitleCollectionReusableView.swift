//
//  SectionHeaderTitleCollectionReusableView.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

import UIKit

class SectionHeaderTitleCollectionReusableView: UICollectionReusableView {
     var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = UIColor.primary
         label.font = UIFont.boldSystemFont(ofSize: 16)
         label.sizeToFit()
         
         return label
     }()
    
    static var identifier = "SectionHeaderTitleCollectionReusableView"
    
     override init(frame: CGRect) {
         super.init(frame: frame)
         
        setTitleLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setTitleLabel()
    }
    
    private func setTitleLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
