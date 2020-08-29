//
//  DataExtensions.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/28/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import Foundation

extension Data {
    func toDictionary() -> [String: Any]? {
        let jsonError: NSError?
        do{
            if let dict = try JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.mutableContainers) as? Dictionary<String, Any> {
                return dict
            }
        }catch let error as NSError {
            jsonError = error
            print(jsonError as Any)
        }
        return nil
    }
}
