//
//  UIImageView+Extension.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation
import Alamofire

extension UIImageView {
    func download(from url: String, onCompletion: ((UIImage?) -> Void)? = nil) {
        AF.request(url).responseData { (response) in
            guard let data = response.data else { return }
            self.image = UIImage(data: data)
            
            if let onCompletion = onCompletion {
                onCompletion(self.image)
            }
        }
    }
}
