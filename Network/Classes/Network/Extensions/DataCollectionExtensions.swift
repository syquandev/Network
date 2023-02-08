//
//  DataCollectionExtensions.swift
//  Alamofire
//
//  Created by Quan on 08/02/2023.
//

import UIKit

extension Array {
    
    @discardableResult
    public func chunked(from: Int = 0, size: Int) -> [Element] {
        var ret = [Element]()
        if from >= self.count{
            return ret
        }
        let to = from + size
        for i in from..<to{
            if let obj = self.objectAtIndex(i){
                ret.append(obj)
            }else{
                return ret
            }
        }
        return ret
    }
    
//    @discardableResult
//    public func objectAtIndex(_ index:Int) -> Element?{
//        return index < self.count ? self[index] : nil
//    }
    
    @discardableResult
    public func objectAtIndex(_ index:Int) -> Element?{
        if index < 0 || index >= self.count {
            return nil
        }
        return self[index]
    }
    
    @discardableResult
    public func at(_ index:Int) -> Element?{
        return self.objectAtIndex(index)
    }
    
    
    @discardableResult
    public func indexOfObject(_ object: Element?) -> Int?{
        guard let object = object else{
            return nil
        }
        return self.index(where: { (item) -> Bool in
            if let a = object as? NSObject,
                let b = item as? NSObject {
                return a == b
            }
            
            return false
        })
    }
    
    
    @discardableResult
    public mutating func safeRemoveObject(_ object:Element?) -> Bool {
        if object == nil {
            return false
        }
        return self.removeObject(object!)
    }
    
    @discardableResult
    public mutating func safeRemoveObjectID(_ object:Element?) -> Bool {
        guard let object = object as? BaseModel,
            let objects = self as? [BaseModel] else {
                return false
        }
        
        var removed = [Element]()
        objects.forEach { (item) in
            if item.getID() == object.getID(){
                removed.safeAppend(item as? Element)
            }
        }
        return self.removeObjects(removed)
    }
    
    @discardableResult
    public mutating func safeRemoveObjectIDs(_ objects:[Element]) -> Bool  {
        var result = false
        
        for item in objects{
            self.safeRemoveObjectID(item)
            result = true
        }
        return result
    }

    
    @discardableResult
    public func indexOfObjectID(_ object:Element?) -> Int? {
        guard let object = object as? BaseModel,
            let objects = self as? [BaseModel] else {
                return nil
        }
        
        var index = 0
        for item in objects{
            if item.getID() == object.getID(){
                return index
            }
            index += 1
        }
        return nil
    }
    
    @discardableResult
    public mutating func safeRemoveClass<T>(_ classType:T.Type) -> [Element] {
        var remove:[Element] = []
        for item in self{
            if item is T{
                remove.append(item)
            }
        }
        self.removeObjects(remove)
        return remove
    }
    
    
    
    @discardableResult
    public mutating func removeObject(_ object:Element) -> Bool {
        var result = false
        if let index = self.indexOfObject(object){
            self.remove(at: index)
            result = true
        }
        return result
    }
    
    @discardableResult
    public mutating func removeObjects(_ objects:[Element]) -> Bool  {
        var result = false
        
        for item in objects{
            self.removeObject(item)
            result = true
        }
        return result
    }

    public mutating func safeAppend(_ object:Element?){
        if object != nil {
            self.append(object!)
        }
    }
    
    public mutating func safeSet(_ object: Element?, index: Int){
        guard let obj = object else{
            return
        }
        if index < 0 {
            return
        }
        
        if index >= self.count{
            return
        }
        self[index] = obj
    }
    
    public mutating func safeAppend(sequence:[Element]?){
        if sequence != nil {
            self.append(contentsOf: sequence!)
        }
    }
    
    public func count(query: (Element) -> Bool) -> Int{
        var count  = 0
        
        for item in self{
            if query(item){
                count += 1
            }
        }
        return count
    }
    
    public func search(query: (Element) -> Bool) -> [Element]?{
        let arrs = self.compactMap { (item) -> Element? in
            if query(item){
                return item
            }
            return nil
        }
        return arrs
    }
    
//    public func mergeUnique(query: (Element) -> Bool) -> [Element]?{
//        setResult.ad
//        let arrs = self.compactMap { (item) -> Element? in
//            if query(item){
//                return item
//            }
//            return nil
//        }
//        return arrs
//    }
    
// Returns the element at the specified index iff it is within bounds, otherwise nil.
//    subscript (safe index: Index) -> Element? {
//        return indices.contains(index) ? self[index] : nil
//    }
}
