//
//  Comic.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/29/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import Foundation

struct Comic{
    var id: Int
    var thumbnailURI: URL
}
func ==(a: Comic, b: Comic) -> Bool {
    return a.hashValue == b.hashValue
}
extension Comic: Hashable{
    
    private static let hashPrefix = "Comic"
    var hashValue: Int {
        return "\(Comic.hashPrefix)\(id)".hashValue
    }
}

class ComicMapper: BaseMapper<Comic>{
    
    private static let dataKey = "data"
    private static let resultsKey = "results"
    private static let idKey = "id"
    private static let thumbnailKey = "thumbnail"
    private static let pathKey = "path"
    private static let extensionKey = "extension"
    
    override class func createObjectFrom(dictionary: Dictionary<String, Any> ) -> Comic?{
        
        if let id = dictionary[idKey] as? Int{
            if let thumbnailDict = dictionary[thumbnailKey] as? Dictionary<String, Any>{
                if let thumbnailPath = thumbnailDict[pathKey] as? String{
                    if let ext = thumbnailDict[extensionKey] as? String{
                        
                        let thumbnailURI =
                            URL(fileURLWithPath: thumbnailPath)
                        let thumbnailURIWithExtension = thumbnailURI.appendingPathExtension(ext)
                            return Comic(id: id, thumbnailURI: thumbnailURIWithExtension)
                
                    }
                }
            }
        }
        
        return super.createObjectFrom(dictionary: dictionary)
    }
    
    override class func getRoot(dictionary: Dictionary<String, Any> ) -> Any?{
        if let dataDict = dictionary[dataKey]  as? Dictionary<String, Any>{
            if let arrayDict = dataDict[resultsKey] as? Array<Any> {
                return arrayDict
            }
        }
        return super.getRoot(dictionary: dictionary)
    }
}
