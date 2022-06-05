//
//  NetworkServiceProtocol.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Alamofire

enum ServiceResult<T> {
    case Success(T, Int)
    case Error(String, Int?)
}

protocol NetworkServiceProtocol {
    var apiKeyTimestampAndHash: String { get }
    var baseUrl: String { get }

    func request(
        url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        onCompletion: @escaping ( ServiceResult<String?> ) -> Void )
}
