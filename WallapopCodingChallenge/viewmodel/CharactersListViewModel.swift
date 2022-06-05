//
//  CharactersListViewModel.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation

class CharacterViewModel: CharacterViewModelProtocol {
    var networkService: NetworkServiceProtocol?

    init() {
        privateCurrentCharacter = CharacterModel(id: 0, name: "", thumbnail: ThumbnailModel(path: "", extension: ""), description: "")
    }
    
    private let pageSize = 20
    
    private var privateCurrentCharacter: CharacterModel
    var currentCharacter: CharacterModel {
        get { return privateCurrentCharacter }
        set { privateCurrentCharacter = newValue }
    }
    
    private var privateCharactersList = [CharacterModel]()
    var charactersList: [CharacterModel] {
        get { return privateCharactersList }
    }

    private var privateComicsList = [ComicModel]()
    var comicsList: [ComicModel] {
        get { return privateComicsList }
    }

    func getCharacters(
        page: Int,
        onCompletion: @escaping ( ServiceResult<[CharacterModel]?> ) -> Void )  {
        let offset = page * pageSize
        guard let networkService = networkService else {
            return onCompletion(.Error("Missing network service", 0))
        }
        let baseUrl = networkService.baseUrl
        let hash = networkService.apiKeyTimestampAndHash
        let url = "\(baseUrl)characters?\(hash)&offset=\(offset)"
        // TODO: filter: &nameStartsWith=Spi
        networkService.request(
            url: url,
            method: .get,
            parameters: nil
        ) { [weak self] (result) in
            if page == 0 {
                self?.privateCharactersList.removeAll()
            }
            switch result {
            case .Success(let json, let statusCode):
                do {
                    if let data = json?.data(using: .utf8) {
                        let decoder = JSONDecoder()
                        let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                        self?.privateCharactersList.append(contentsOf: characterResponse.data.results)
                        
                        return onCompletion(.Success(self?.privateCharactersList, statusCode))
                    }
                    
                    return onCompletion(.Error("Error parsing data", statusCode))
                } catch {
                    debugPrint("error:\(error)")
                    
                    return onCompletion(.Error("Error decoding JSON", statusCode))
                }
            case .Error(let message, let statusCode):
                return onCompletion(.Error(message, statusCode))
            }
        }
    }
    
    func getCharacterComics(
        page: Int,
        character: Int,
        onCompletion: @escaping ( ServiceResult<[ComicModel]?> ) -> Void )  {
        let offset = page * pageSize
        guard let networkService = networkService else {
            return onCompletion(.Error("Missing network service", 0))
        }
        let baseUrl = networkService.baseUrl
        let hash = networkService.apiKeyTimestampAndHash
        let url = "\(baseUrl)characters/\(character)/comics?\(hash)&offset=\(offset)"
        networkService.request(
            url: url,
            method: .get,
            parameters: nil
        ) { [weak self] (result) in
            if page == 0 {
                self?.privateComicsList.removeAll()
            }
            switch result {
            case .Success(let json, let statusCode):
                do {
                    if let data = json?.data(using: .utf8) {
                        let decoder = JSONDecoder()
                        let comicResponse = try decoder.decode(ComicResponse.self, from: data)
                        self?.privateComicsList.append(contentsOf: comicResponse.data.results)
                        return onCompletion(.Success(self?.privateComicsList, statusCode))
                    }
                    
                    return onCompletion(.Error("Error parsing data", statusCode))
                } catch {
                    debugPrint("error:\(error)")
                    
                    return onCompletion(.Error("Error decoding JSON", statusCode))
                }
            case .Error(let message, let statusCode):
                return onCompletion(.Error(message, statusCode))
            }
        }
    }
}
