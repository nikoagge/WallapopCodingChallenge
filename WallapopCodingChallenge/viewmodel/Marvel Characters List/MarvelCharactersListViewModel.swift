//
//  MarvelCharactersListViewModel.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

enum ListChoice {
    case search
    case allCharacters
}

final class MarvelCharactersListViewModel: MarvelCharactersListViewModelProtocol {
    private let provider: MoyaProvider<MarvelProvider>
    private var offset: Int = 0
    private var limitPerPage: Int = 20
    var minimumChars = 3
    var characters: [Character] = []
    var displayMode: ListChoice = .allCharacters
    
    init(with provider:  MoyaProvider<MarvelProvider>) {
        self.provider = provider
    }
    
    func getAllMarvelCharacters() -> Observable<[Character]> {
        return provider.rx.request(.getMarvelCharacters(offset: 0, limitPerPage: limitPerPage))
            .asObservable()
            .map(CharacterList.self)
            .flatMap({ [weak self] list -> Observable<[Character]> in
                self?.displayMode = .allCharacters
                self?.offset = 0
                return Observable.just(list.characters)
            }).retry(2)
    }
    
    func searchMarvelCharacter(with query: String) -> Observable<[Character]> {
        return provider.rx.request(.searchMarvelCharacter(query: query))
            .asObservable()
            .map(CharacterList.self)
            .flatMap({ [weak self] list -> Observable<[Character]> in
                self?.displayMode = .search
                return Observable.just(list.characters)
            }).retry(2)
    }
    
    func fetchMarvelCharacters() -> Observable<[Character]> {
        offset = offset + limitPerPage
        return provider.rx.request(.getMarvelCharacters(offset: offset, limitPerPage: limitPerPage))
            .asObservable()
            .map(CharacterList.self)
            .flatMap({ [weak self] list -> Observable<[Character]> in
                self?.displayMode = .allCharacters
                return Observable.just(list.characters)
            }).retry(2)
    }
    
    func showDetailCharacter(with character: Character, navigation: UINavigationController?) {
        let vm = MarvelCharacterViewModel(with: provider, character: character)
        let vc = MarvelCharacterDetailViewController(with: vm)
        navigation?.modalPresentationStyle = .fullScreen
        navigation?.pushFadeAnimation(viewController: vc)
    }
}
