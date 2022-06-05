//
//  Constants.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 5/6/22.
//

import UIKit

enum Constants {
    static let appStoreURL = "itms-apps://apple.com/app/xxxxxxxx" // TODO: add the appstore url
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    static let appPlatform = "ios"
    static let deviceManufacturer = "Apple Inc."
    static let deviceModel = UIDevice().type.rawValue
    static let osVersion = UIDevice.current.systemVersion
    static let screenSize = UIScreen.main.bounds.size
}

private extension UIDevice {
    enum Model : String {
        case simulator     = "simulator/sandbox",
             //iPod
             iPod1              = "iPod 1",
             iPod2              = "iPod 2",
             iPod3              = "iPod 3",
             iPod4              = "iPod 4",
             iPod5              = "iPod 5",
             //iPad
             iPad2              = "iPad 2",
             iPad3              = "iPad 3",
             iPad4              = "iPad 4",
             iPadAir            = "iPad Air ",
             iPadAir2           = "iPad Air 2",
             iPadAir3           = "iPad Air 3",
             iPadAir4           = "iPad Air 4",
             iPad5              = "iPad 5", //aka iPad 2017
             iPad6              = "iPad 6", //aka iPad 2018
             iPad7              = "iPad 7", //aka iPad 2019
             iPad8              = "iPad 8", //aka iPad 2020
             //iPad mini
             iPadMini           = "iPad Mini",
             iPadMini2          = "iPad Mini 2",
             iPadMini3          = "iPad Mini 3",
             iPadMini4          = "iPad Mini 4",
             iPadMini5          = "iPad Mini 5",
             //iPad pro
             iPadPro9_7         = "iPad Pro 9.7\"",
             iPadPro10_5        = "iPad Pro 10.5\"",
             iPadPro11          = "iPadPro11",
             iPadPro2_11        = "iPad Pro 11\" 2nd gen",
             iPadPro12_9        = "iPad Pro 12.9\"",
             iPadPro2_12_9      = "iPad Pro 2 12.9\"",
             iPadPro3_12_9      = "iPad Pro 3 12.9\"",
             iPadPro4_12_9      = "iPad Pro 4 12.9\"",
             //iPhone
             iPhone4            = "iPhone 4",
             iPhone4S           = "iPhone 4S",
             iPhone5            = "iPhone 5",
             iPhone5S           = "iPhone 5S",
             iPhone5C           = "iPhone 5C",
             iPhone6            = "iPhone 6",
             iPhone6plus        = "iPhone 6 Plus",
             iPhone6S           = "iPhone 6S",
             iPhone6Splus       = "iPhone 6S Plus",
             iPhoneSE           = "iPhone SE",
             iPhoneSE2ndGen     = "iPhone SE 2nd Gen",
             iPhone7            = "iPhone 7",
             iPhone7plus        = "iPhone 7 Plus",
             iPhone8            = "iPhone 8",
             iPhone8plus        = "iPhone 8 Plus",
             iPhoneX            = "iPhone X",
             iPhoneXS           = "iPhone XS",
             iPhoneXSMax        = "iPhone XS Max",
             iPhoneXR           = "iPhone XR",
             iPhone11           = "iPhone 11",
             iPhone11Pro        = "iPhone 11 Pro",
             iPhone11ProMax     = "iPhone 11 Pro Max",
             iPhone12Mini       = "iPhone 12 Mini",
             iPhone12           = "iPhone 12",
             iPhone12Pro        = "iPhone 12 Pro",
             iPhone12ProMax     = "iPhone 12 Pro Max",
             iPhone13Pro        = "iPhone13Pro",
             iPhone13ProMax     = "iPhone13ProMax",
             iPhone13Mini       = "iPhone13Mini",
             iPhone13           = "iPhone13",
             //Apple TV
             AppleTV            = "Apple TV",
             AppleTV_4K         = "Apple TV 4K",
             unrecognized       = "?unrecognized?"
    }

    var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)

            }
        }
        let modelMap : [ String : Model ] = [
            "i386"      : .simulator,
            "x86_64"    : .simulator,
            "arm64"     : .simulator,
            //iPod
            "iPod1,1"   : .iPod1,
            "iPod2,1"   : .iPod2,
            "iPod3,1"   : .iPod3,
            "iPod4,1"   : .iPod4,
            "iPod5,1"   : .iPod5,
            //iPad
            "iPad2,1"   : .iPad2,
            "iPad2,2"   : .iPad2,
            "iPad2,3"   : .iPad2,
            "iPad2,4"   : .iPad2,
            "iPad3,1"   : .iPad3,
            "iPad3,2"   : .iPad3,
            "iPad3,3"   : .iPad3,
            "iPad3,4"   : .iPad4,
            "iPad3,5"   : .iPad4,
            "iPad3,6"   : .iPad4,
            "iPad6,11"  : .iPad5, //aka iPad 2017
            "iPad6,12"  : .iPad5,
            "iPad7,5"   : .iPad6, //aka iPad 2018
            "iPad7,6"   : .iPad6,
            "iPad7,11"  : .iPad7, //iPad 2019
            "iPad7,12"  : .iPad7,
            "iPad11,6"  : .iPad8, //iPad 2020
            "iPad11,7"  : .iPad8,
            //iPad mini
            "iPad2,5"   : .iPadMini,
            "iPad2,6"   : .iPadMini,
            "iPad2,7"   : .iPadMini,
            "iPad4,4"   : .iPadMini2,
            "iPad4,5"   : .iPadMini2,
            "iPad4,6"   : .iPadMini2,
            "iPad4,7"   : .iPadMini3,
            "iPad4,8"   : .iPadMini3,
            "iPad4,9"   : .iPadMini3,
            "iPad5,1"   : .iPadMini4,
            "iPad5,2"   : .iPadMini4,
            "iPad11,1"  : .iPadMini5, //
            "iPad11,2"  : .iPadMini5, //
            //iPad pro
            "iPad6,3"   : .iPadPro9_7,
            "iPad6,4"   : .iPadPro9_7,
            "iPad7,3"   : .iPadPro10_5,
            "iPad7,4"   : .iPadPro10_5,
            "iPad8,1"   : .iPadPro11, //
            "iPad8,2"   : .iPadPro11, //
            "iPad8,3"   : .iPadPro11, //
            "iPad8,4"   : .iPadPro11, //
            "iPad8,9"   : .iPadPro2_11,
            "iPad8,10"  : .iPadPro2_11,
            "iPad6,7"   : .iPadPro12_9,
            "iPad6,8"   : .iPadPro12_9,
            "iPad7,1"   : .iPadPro2_12_9,
            "iPad7,2"   : .iPadPro2_12_9,
            "iPad8,5"   : .iPadPro3_12_9,
            "iPad8,6"   : .iPadPro3_12_9,
            "iPad8,7"   : .iPadPro3_12_9,
            "iPad8,8"   : .iPadPro3_12_9,
            "iPad8,11"  : .iPadPro4_12_9,
            "iPad8,12"  : .iPadPro4_12_9,

            //iPad Air
            "iPad4,1"   : .iPadAir,
            "iPad4,2"   : .iPadAir,
            "iPad4,3"   : .iPadAir,
            "iPad5,3"   : .iPadAir2,
            "iPad5,4"   : .iPadAir2,
            "iPad11,3"  : .iPadAir3,
            "iPad11,4"  : .iPadAir3,
            "iPad13,1"  : .iPadAir4,
            "iPad13,2"  : .iPadAir4,

            //iPhone
            "iPhone3,1" : .iPhone4,
            "iPhone3,2" : .iPhone4,
            "iPhone3,3" : .iPhone4,
            "iPhone4,1" : .iPhone4S,
            "iPhone5,1" : .iPhone5,
            "iPhone5,2" : .iPhone5,
            "iPhone5,3" : .iPhone5C,
            "iPhone5,4" : .iPhone5C,
            "iPhone6,1" : .iPhone5S,
            "iPhone6,2" : .iPhone5S,
            "iPhone7,1" : .iPhone6plus,
            "iPhone7,2" : .iPhone6,
            "iPhone8,1" : .iPhone6S,
            "iPhone8,2" : .iPhone6Splus,
            "iPhone8,4" : .iPhoneSE,
            "iPhone12,8" : .iPhoneSE2ndGen,
            "iPhone9,1" : .iPhone7,
            "iPhone9,3" : .iPhone7,
            "iPhone9,2" : .iPhone7plus,
            "iPhone9,4" : .iPhone7plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,4" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,5" : .iPhone8plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,6" : .iPhoneX,
            "iPhone11,2" : .iPhoneXS,
            "iPhone11,4" : .iPhoneXSMax,
            "iPhone11,6" : .iPhoneXSMax,
            "iPhone11,8" : .iPhoneXR,
            "iPhone12,1" : .iPhone11,
            "iPhone12,3" : .iPhone11Pro,
            "iPhone12,5" : .iPhone11ProMax,
            "iPhone13,1" : .iPhone12Mini,
            "iPhone13,2" : .iPhone12,
            "iPhone13,3" : .iPhone12Pro,
            "iPhone13,4" : .iPhone12ProMax,
            "iPhone14,4" : .iPhone13Mini,
            "iPhone14,5" : .iPhone13,
            "iPhone14,2" : .iPhone13Pro,
            "iPhone14,3" : .iPhone13ProMax,


            //AppleTV
            "AppleTV5,3" : .AppleTV,
            "AppleTV6,2" : .AppleTV_4K
        ]

        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return Model.unrecognized
    }
}
