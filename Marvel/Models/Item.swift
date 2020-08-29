//
//  File.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/29/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import Foundation

struct Item{
    var name: String
    var resourceURI: URL
}

func ==(a: Item, b: Item) -> Bool {
    return a.hashValue == b.hashValue
}
extension Item: Hashable{
    
    private static let hashPrefix = "Item"
    var hashValue: Int {
        return "\(Item.hashPrefix)\(name.hashValue)".hashValue
    }
}

class ItemMapper: BaseMapper<Item>{
    
    private static let nameKey = "name"
    private static let resourceURIKey = "resourceURI"
    
    
    override class func createObjectFrom(dictionary: Dictionary<String, Any> ) -> Item?{
        
        if let name =  dictionary[ nameKey ] as? String{
            let resourceURI =  URL(string:dictionary[resourceURIKey] as! String)

            return Item(name: name, resourceURI: resourceURI!)
            
            
        }
        
        
        return super.createObjectFrom(dictionary: dictionary)
    }
}
