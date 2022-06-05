//
//  CatalogViewModel.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 28/5/22.
//

import UIKit
import Alamofire

class CatalogViewModel {
    static let limit: Int = 100
    
    private var marvelData: MarvelData!
    private var marvelCharacters: [MarvelCharacter] = []
    
    private var marvelService: MarvelService!
    
    init(marvelService: MarvelService) {
        self.marvelService = marvelService
    }
    
    func numberOfItems() -> Int {
        return marvelCharacters.count
    }
    
    func catalogTableViewCellViewModel(for indexPath: IndexPath) -> CatalogTableViewCellViewModel {
        return CatalogTableViewCellViewModel(marvelService: marvelService, marvelCharacter: marvelCharacters[indexPath.row])
    }
    
    func catalogDetailViewModel(for indexPath: IndexPath) -> CatalogDetailViewModel {
        return CatalogDetailViewModel(marvelService: marvelService, marvelCharacter: marvelCharacters[indexPath.row])
    }
    
    func fetchIfNeeded(for indexPath: IndexPath, name: String? = nil, onCompletion: @escaping () -> Void) {
        if marvelData.hasMore() && indexPath.row == numberOfItems() - 1 {
            fetchMarvelCharacters(offset: CatalogViewModel.limit, name: name, onCompletion: onCompletion)
        }
    }
    
    func fetchMarvelCharacters(offset: Int, name: String? = nil, onCompletion: @escaping () -> Void)  {
        if offset == 0 {
            marvelCharacters = []
        }
        
//        marvelService.getMarvelCharacters(offset: offset, name: name) { (result) in
//            if let value = result.value {
//                self.marvelData = value.marvelData
//                self.marvelCharacters += value.marvelData.marvelCharacters.filter { (marvelCharacter) -> Bool in
//                    return !marvelCharacter.thumbnail.path.contains("image_not_available")
//                }
//            }
//            onCompletion()
//        }
    }
    
    func fetchMarvelCharactersByName(name: String, onCompletion: @escaping () -> Void) {
//        self.marvelCharacters = []
//        self.fetchMarvelCharacters(offset: 0, name: name, onCompletion: onCompletion)
    }
}
