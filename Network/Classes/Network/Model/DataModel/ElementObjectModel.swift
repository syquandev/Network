//
//  ElementObjectModel.swift
//  Network
//
//  Created by Quan on 08/02/2023.
//

import Foundation
import ObjectMapper

open class ElementObjectModel<T: IBaseModel>: BaseModel{
    public var status: ElementStatusModel?
    public var elements: T?
    public var token: String?
    
    override open func mapping(map: Map) {
        status <- map["status"]
        elements <- map["data"]
        token   <- map["token"]
    }
}
