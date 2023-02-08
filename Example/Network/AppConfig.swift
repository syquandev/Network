//
//  AppConfig.swift
//  Network_Example
//
//  Created by Quan on 08/02/2023.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import Network

class AppConfig : NSObject, ConfigInterface{
    func setServer(_ type: ServerType) {
        Config.mode(type)
    }
    
    func remoteConfig() {
        
    }
    
    
}
