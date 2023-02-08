//
//  ElementStatusModel.swift
//  Network
//
//  Created by Quan on 08/02/2023.
//

import UIKit
import ObjectMapper

public class ElementStatusModel: BaseModel {
    public var success: Bool?
    public var errors: String?
    public var code: Int?
    
    override public func mapping(map: Map) {
        success <- map["success"]
        errors <- map["errors"]
        code <- map["code"]
    }
}
