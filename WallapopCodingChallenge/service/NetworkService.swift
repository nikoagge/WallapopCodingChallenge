//
//  NetworkService.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import Foundation
import Alamofire

class NetworkService: NetworkServiceProtocol {
    static let shared = NetworkService()
    
    private init() {}
    
    var alamofireWrapper: AlamofireWrapperProtocol?

    private let verbose = true

    private func verbosePrint(_ message: String) {
        if verbose {
            debugPrint(message)
        }
    }
    
    var apiKeyTimestampAndHash: String {
        get {
            let publicKey = Credentials.publicKey
            let privateKey = Credentials.privateKey
            let timestamp = String(Date().timeIntervalSince1970 * 1000)
            let hash = HashGenerator.hash(timestamp: timestamp, privateKey: privateKey, publicKey: publicKey)
            
            return "apikey=\(publicKey)&ts=\(timestamp)&hash=\(hash)"
        }
    }
    
    var baseUrl: String {
        get {
            return "https://gateway.marvel.com/v1/public/"
        }
    }
    
    private func treatError(url: String, response: DataResponse<String>) -> String{
        verbosePrint("error=\(response.description)")
        if let localizedDescription = response.result.error?.localizedDescription {
            return localizedDescription
        } else if response.result.debugDescription.count > 0 {
            return response.result.debugDescription
        }
        return "error: \(response.response?.statusCode ?? 0)"
    }
    
    func request(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        onCompletion: @escaping ( ServiceResult<String?> ) -> Void )
    {
        guard let alamofireWrapper = alamofireWrapper else {
            return onCompletion(.Error("Error creating request", 0))
        }

        alamofireWrapper.responseString(url, method: method, parameters: parameters, encoding: JSONEncoding.default)
        { [weak self] response in
            self?.verbosePrint("url=\(response.request?.url?.description ?? "")")
            let statusCode = response.response?.statusCode ?? -1
            self?.verbosePrint("status code=\(statusCode)")
            if response.result.isSuccess {
                return onCompletion(.Success(response.result.value, statusCode))
            }
            
            return onCompletion(.Error(self?.treatError(url: url, response: response) ?? "", response.response?.statusCode))
        }
    }
}
