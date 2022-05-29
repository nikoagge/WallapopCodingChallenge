//
//  CatalogDetailViewModel.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import Foundation
import Alamofire

class CatalogDetailViewModel {
    private var marvelService: MarvelService!
    private var marvelCharacter: MarvelCharacter!

    var thumbnailURL: String {
        return marvelCharacter.thumbnail.urlPath(thumbnailType: .portraitFantastic)
    }
    
    func marvelCharacterName() -> String {
        return marvelCharacter.name
    }
    
    func marvelCharacterDescription() -> String {
        return marvelCharacter.description
    }
    
    func getLink(to marvelURLType: MarvelURLType) -> MarvelUrl? {
        return marvelCharacter.getLink(to: marvelURLType)
    }
    
    init(marvelService: MarvelService, marvelCharacter: MarvelCharacter) {
        self.marvelService = marvelService
        self.marvelCharacter = marvelCharacter
    }
}
