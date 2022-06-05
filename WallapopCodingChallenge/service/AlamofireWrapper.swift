//
//  AlamofireWrapper.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Alamofire
import Foundation

class AlamofireWrapper: AlamofireWrapperProtocol {
    var manager: Alamofire.SessionManager
    
    init() {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            "gateway.marvel.com": .disableEvaluation
        ]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        manager = Alamofire.SessionManager(
            configuration: URLSessionConfiguration.default,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }
    
    func responseString(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        onCompletion: @escaping (DataResponse<String>) -> Void
    ) {
        manager.request(url, method: method, parameters: parameters, encoding: encoding).responseString(completionHandler: onCompletion)
    }
}
