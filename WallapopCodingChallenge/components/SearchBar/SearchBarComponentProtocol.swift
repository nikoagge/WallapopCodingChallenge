//
//  SearchBarComponentProtocol.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation
import RxSwift

public typealias SearchBarAction = (
    didTap: Observable<Void>,
    editingDidBegin: Observable<Void>,
    editingDidEnd: Observable<Void>,
    text: Observable<String>,
    didSearch: Observable<String>
)

public protocol SearchBarComponentProtocol {
    var actions: SearchBarAction { get }
    var text: String? { get set }
    var placeholder: String? { get set }
    var isInSearchMode: Bool { get set }
    var delegate: UITextFieldDelegate? { get set }
    func becomeFirstResponder()
    func resignFirstResponder()
    func selectAll(_ sender: Any?)
}
