//
//  APIParameters.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 26/5/22.
//

import Foundation
import Alamofire

class APIParameters {
    private var parameters = Parameters()
    private let defaultParameters: Parameters = [
        "limit": 100,
        "orderBy": "-modified"
    ]
    
    init() {
        parameters = defaultParameters
    }
    
    func hash(timestamp: String, privateKey: String, publicKey: String) -> APIParameters {
        parameters["hash"] = HashGenerator.hash(timestamp: timestamp, privateKey: privateKey, publicKey: publicKey)
        
        return self
    }
    
    func apiKey(_ apiKey: String) -> APIParameters {
        parameters["apiKey"] = apiKey
        
        return self
    }
    
    func timestamp(_ timeStamp: String) -> APIParameters {
        parameters["timestamp"] = timeStamp
        
        return self
    }
    
    func name(_ name: String) -> APIParameters {
        parameters["nameStartsWith"] = name
        
        return self
    }
    
    func offset(_ offset: Int) -> APIParameters {
        parameters["offset"] = offset
        
        return self
    }
    
    func limit(_ limit: Int) -> APIParameters {
        parameters["limit"] = limit
        
        return self
    }
    
    func orderBy(_ orderBy: String) -> APIParameters {
        parameters["orderBy"] = orderBy
        
        return self
    }
    
    func build() -> Parameters {
        return parameters
    }
}
