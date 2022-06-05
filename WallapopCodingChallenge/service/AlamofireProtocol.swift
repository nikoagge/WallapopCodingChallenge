//
//  AlamofireProtocol.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation
import Alamofire

protocol AlamofireWrapperProtocol {
    func responseString(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        onCompletion: @escaping (DataResponse<String>) -> Void
    )
}
