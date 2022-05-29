//
//  APIConfiguration.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 26/5/22.
//

import Foundation
import Alamofire

private enum APIConfigurationKeys: String {
    case url
    case publicKey
    case privateKey
}

class APIConfiguration {
    static let shared = APIConfiguration()
    static var suiteName = "CatalogUserDefaults"
    
    private let userDefaults = UserDefaults(suiteName: APIConfiguration.suiteName)!
    
    var url: String {
        get {
            self.userDefaults.string(forKey: APIConfigurationKeys.url.rawValue)!
        }
        
        set {
            storeURL(url: newValue)
        }
    }
    
    var publicKey: String {
        get {
            self.userDefaults.string(forKey: APIConfigurationKeys.publicKey.rawValue)!
        }
        
        set {
            storePublicKey(publicKey: newValue)
        }
    }
    
    var privateKey: String {
        get {
            self.userDefaults.string(forKey: APIConfigurationKeys.privateKey.rawValue)!
        }
        
        set {
            storePrivateKey(privateKey: newValue)
        }
    }
    
    private init() {
        if self.userDefaults.string(forKey: APIConfigurationKeys.privateKey.rawValue) == nil {
            let fileURL = Bundle.main.url(forResource: "APIConfiguration", withExtension: "json")!
            let jsonData = try! Data(contentsOf: fileURL)
            let properties = try! JSONDecoder().decode(Dictionary<String, String>.self, from: jsonData)
            setProperties(properties: properties)
        }
    }
    
    private func setProperties(properties: Dictionary<String, String>) {
        storeURL(url: properties[APIConfigurationKeys.url.rawValue]!)
        storePublicKey(publicKey: properties[APIConfigurationKeys.publicKey.rawValue]!)
        storePrivateKey(privateKey: properties[APIConfigurationKeys.privateKey.rawValue]!)
    }
    
    private func storeURL(url: String) {
        userDefaults.set(url, forKey: APIConfigurationKeys.url.rawValue)
    }
    
    private func storePublicKey(publicKey: String) {
        userDefaults.set(publicKey, forKey: APIConfigurationKeys.publicKey.rawValue)
    }
    
    private func storePrivateKey(privateKey: String) {
        userDefaults.set(privateKey, forKey: APIConfigurationKeys.privateKey.rawValue)
    }
    
    func url(with path: String) -> String {
        return "\(url)\(path)";
    }
    
    func apiParameters() -> APIParameters {
        let timestamp = String(Date().timeIntervalSince1970 * 1000)
        
        return APIParameters()
            .hash(timestamp: timestamp, privateKey: privateKey, publicKey: publicKey)
            .timestamp(timestamp)
            .apiKey(publicKey)
    }
}
