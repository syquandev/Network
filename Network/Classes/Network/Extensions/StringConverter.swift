//
//  StringConverter.swift
//  Network
//
//  Created by Quan on 08/02/2023.
//

import UIKit
import ObjectMapper

extension String {
    public func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
extension String {
    
    public func int() -> Int?{
        return Int(self)
    }
    
    public func float() -> CGFloat?{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        var pure = self
        if let currencyGroupingSeparator = formatter.currencyGroupingSeparator{
            pure = self.replacingOccurrences(of: currencyGroupingSeparator, with: "")
        }
        
        if let n = NumberFormatter().number(from: pure) {
            let ret = CGFloat(truncating: n)
            return ret
        }
        
        return nil
    }
    
    public static func numberFormatted(_ num: Int?) -> String?{
        guard let num = num else{
            return nil
        }
        
//
        let number = NSNumber(value: num)
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        return formatter.string(from: number)
        
//        let locale = Locale(identifier: Session.current.getLanguageCode())
        
        let numberFormat = NumberFormatter()
//        numberFormat.locale = locale
        numberFormat.groupingSize = 3
        numberFormat.usesGroupingSeparator = true
        numberFormat.maximumFractionDigits = 2
        numberFormat.minimumFractionDigits = 0
        
        return numberFormat.string(from: number)
    }
    
    public static func numberFormatted(_ num: CGFloat?) -> String?{
        guard let num = num else{
            return nil
        }
        let fl = Double(num)
        let number = NSNumber(value: fl)
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        return formatter.string(from: number)
        
//        let locale = Locale(identifier: Session.current.getLanguageCode())
        
        let numberFormat = NumberFormatter()
//        numberFormat.locale = locale
        numberFormat.groupingSize = 3
        numberFormat.usesGroupingSeparator = true
        numberFormat.maximumFractionDigits = 2
        numberFormat.minimumFractionDigits = 0
        
        return numberFormat.string(from: number)
    }
    
    public func base64() -> String {
        let data = self.data(using: String.Encoding.utf8)
        if let b64  = data?.base64EncodedString() {
            return b64;
        }
        return "";
    }
    
    public func subRange(regex: String) -> [Range<String.Index>] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.compactMap {
                Range($0.range, in: self)
            }
        } catch let error {
//            Log.console("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    public func remove(regex:String) -> String {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let range = NSMakeRange(0, self.count)
            return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "")
        } catch let error {
//            Log.console("invalid regex: \(error.localizedDescription)")
            return ""
        }
    }
    public func subNSRange(regex: String) -> [NSRange] {
        let range = self.subRange(regex: regex)
        return range.compactMap{
            NSRange($0, in: self)
        }
    }
    
    public func encodeEmoji() -> String{
        if let intNum = Int(self, radix: 16){
            if let scalar = UnicodeScalar(intNum){
                return String(scalar)
            }
        }
        return self
    }
    
    public func noBlank() -> String?{
        let trim = self.trimBlankSpace()
        if trim.count == 0{
            return nil
        }
        
        return trim
    }
    
    
    
    private static let vietnameseCode:[Character: Character] = ["??":"a",
    "??":"a",
    "???":"a",
    "??":"a",
    "???":"a",
    "??":"a",
    "???":"a",
    "???":"a",
    "???":"a",
    "???":"a",
    "???":"a",
    "??":"a",
    "???":"a",
    "???":"a",
    "???":"a",
    "???":"a",
    "???":"a",
    "??":"d",
    "??":"e",
    "??":"e",
    "???":"e",
    "???":"e",
    "???":"e",
    "??":"e",
    "???":"e",
    "???":"e",
    "???":"e",
    "???":"e",
    "???":"e",
    "??":"i",
    "??":"i",
    "???":"i",
    "??":"i",
    "???":"i",
    "??":"o",
    "??":"o",
    "???":"o",
    "??":"o",
    "???":"o",
    "??":"o",
    "???":"o",
    "???":"o",
    "???":"o",
    "???":"o",
    "???":"o",
    "??":"o",
    "???":"o",
    "???":"o",
    "???":"o",
    "???":"o",
    "???":"o",
    "??":"u",
    "??":"u",
    "???":"u",
    "??":"u",
    "???":"u",
    "??":"u",
    "???":"u",
    "???":"u",
    "???":"u",
    "???":"u",
    "???":"u",
    "??":"y",
    "???":"y",
    "???":"y",
    "???":"y",
    "???":"y",
    "??":"A",
    "??":"A",
    "???":"A",
    "??":"A",
    "???":"A",
    "??":"A",
    "???":"A",
    "???":"A",
    "???":"A",
    "???":"A",
    "???":"A",
    "??":"A",
    "???":"A",
    "???":"A",
    "???":"A",
    "???":"A",
    "???":"A",
    "??":"D",
    "??":"E",
    "??":"E",
    "???":"E",
    "???":"E",
    "???":"E",
    "??":"E",
    "???":"E",
    "???":"E",
    "???":"E",
    "???":"E",
    "???":"E",
    "??":"I",
    "??":"I",
    "???":"I",
    "??":"I",
    "???":"I",
    "??":"O",
    "??":"O",
    "???":"O",
    "??":"O",
    "???":"O",
    "??":"O",
    "???":"O",
    "???":"O",
    "???":"O",
    "???":"O",
    "???":"O",
    "??":"O",
    "???":"O",
    "???":"O",
    "???":"O",
    "???":"O",
    "???":"O",
    "??":"U",
    "??":"U",
    "???":"U",
    "??":"U",
    "???":"U",
    "??":"U",
    "???":"U",
    "???":"U",
    "???":"U",
    "???":"U",
    "???":"U",
    "??":"Y",
    "???":"Y",
    "???":"Y",
    "???":"Y",
    "???":"Y"
    ]
    
    public func convertVietNam() -> String {
        let arr = Array(self).compactMap { (char) -> Character? in
            if let obj = String.vietnameseCode[char]{
                return obj
            }
            return char
        }
        
        return String(arr)
    }
    
    public var latinized: String {
        return folding(options: .diacriticInsensitive, locale: Locale.current)
    }
    
    public static func durationFrom(double: Double) -> String{
        let totalSeconds = double
        let hours = Int(totalSeconds / 3600)
        let minutes = Int((totalSeconds.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes,seconds )
        }
        
        return String(format: "%02d:%02d", minutes,seconds )
    }
    
    public func toJSON() -> [String: Any]?{
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: true)
        if let data = data {
            let parsedJSON: [String: Any]?
            do {
                parsedJSON = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : Any]
            } catch let error {
                print(error)
                parsedJSON = nil
            }
            return parsedJSON
        }
        
        return nil
    }
    
}

