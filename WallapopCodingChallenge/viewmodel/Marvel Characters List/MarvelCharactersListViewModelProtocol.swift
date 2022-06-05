//
//  MarvelCharactersListViewModelProtocol.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation
import RxCocoa
import UIKit
import RxSwift

protocol MarvelCharactersListViewModelProtocol {
    var characters: [Character] { get set }
    var displayMode: ListChoice { get set }
    var minimumChars: Int { get set }
    
    func getAllMarvelCharacters() -> Observable<[Character]>
    func fetchMarvelCharacters() -> Observable<[Character]>
    func searchMarvelCharacter(with query: String) -> Observable<[Character]>
    func showDetailCharacter(with character: Character, navigation: UINavigationController?)
}
