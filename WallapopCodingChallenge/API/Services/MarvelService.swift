//
//  MarvelService.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation
import Alamofire

class MarvelService {
    var apiConfiguration: APIConfiguration!
    
    init(apiConfiguration: APIConfiguration) {
        self.apiConfiguration = apiConfiguration
    }
    
    func getCharacters(offset: Int, name: String? = nil, onCompletion: @escaping (AFDataResponse<MarvelCharacterResult>) -> Void) {
        
    }
}
