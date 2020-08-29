//
//  ApiManager.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/29/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import Foundation

struct ApiManager{
    static let request = Request(baseUrl: Config.baseUrl, privateKey: Config.Keys.marvelPrivate, publicKey: Config.Keys.marvelPublic)
}
