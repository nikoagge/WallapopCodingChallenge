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
    
    func getMarvelCharacters(offset: Int, name: String? = nil, onCompletion: @escaping (AFDataResponse<MarvelCharacterResult>) -> Void) {
        var apiParameters = apiConfiguration.apiParameters()
        
        if let name = name {
            if !name.isEmpty {
                apiParameters  = apiParameters.name(name)
            }
        }
        
        AF.request(apiConfiguration.url(with: "/characters"), parameters: apiParameters.build(), encoding: URLEncoding.queryString)
            .responseDecodable(of: MarvelCharacterResult.self, completionHandler: onCompletion)
    }
}
