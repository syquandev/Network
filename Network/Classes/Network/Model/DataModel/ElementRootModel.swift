//
//  ElementRootModel.swift
//  Network
//
//  Created by Quan on 08/02/2023.
//

import UIKit
import ObjectMapper

open class ElementRootModel<T:IBaseModel>: BaseModel {
    public var status: ElementStatusModel?
    public var elements: [T]?
    
    override open func mapping(map: Map) {
        status <- map["status"]
        elements <- map["elements"]
    }

}

