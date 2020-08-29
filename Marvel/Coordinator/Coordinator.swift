//
//  Coordinator.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/28/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationCoordinator : UINavigationController { get set }
    func start()
}
