//
//  CharactersListViewModelProtocol.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation

protocol CharacterViewModelProtocol {
    func getCharacters(
        page: Int,
        onCompletion: @escaping ( ServiceResult<[CharacterModel]?>
        ) -> Void
    )
    
    var charactersList: [CharacterModel] { get }
    var currentCharacter: CharacterModel { get set }

    func getCharacterComics(
        page: Int,
        character: Int,
        onCompletion: @escaping ( ServiceResult<[ComicModel]?>
        ) -> Void
    )

    var comicsList: [ComicModel] { get }
}
