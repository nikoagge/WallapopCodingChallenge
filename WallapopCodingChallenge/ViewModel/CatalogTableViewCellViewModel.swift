//
//  CatalogTableViewCellViewModel.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit

class CatalogTableViewCellViewModel {
    var marvelService: MarvelService!
    var marvelCharacter: MarvelCharacter!
    
    var marvelCharacterName: String {
        return marvelCharacter.name
    }
    
    var thumbnailURL: String {
        return marvelCharacter.thumbnail.urlPath(thumbnailType: .portraitMedium)
    }
    
    init(marvelService: MarvelService, marvelCharacter: MarvelCharacter) {
        self.marvelService = marvelService
        self.marvelCharacter = marvelCharacter
    }
}
