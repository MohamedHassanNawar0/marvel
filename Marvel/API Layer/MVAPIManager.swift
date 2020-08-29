//
//  MVAPIManager.swift
//  Marvelo
//
//  Created by Muhammad Hassan on 11/27/17.
//  Copyright © 2020 Nawar. All rights reserved.
//

import Foundation

struct MVApiManager{
    static let request = MVRequest(baseUrl: Config.baseUrl, privateKey: Config.Keys.marvelPrivate, publicKey: Config.Keys.marvelPublic)
}
