//
//  AppCoordinator.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/28/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import Foundation
import UIKit

//class AppCoordinator : Coordinator {
//    
//    var navigationCoordinator: UINavigationController
//    
//    init(navigationController: UINavigationController) {
//        self.navigationCoordinator = navigationController
//    }
//    
//    func start() {
//        showMasterView()
//    }
//    
//    func showMasterView() {
//        let viewModel = CharactersViewModel(apiService: MarvelApiService())
//        viewModel.coordinator = self
//        let vc = CharactersViewController.instantiate()
//        vc.viewModel = viewModel
//        
//        vc.title = "Marvel Heroes"
//        navigationCoordinator.pushViewController(vc, animated: false)
//    }
//    
//    
//    func showDetailsView(character: Character) {
//        print(character)
//        let viewModel = CharactersViewModel(apiService: MarvelApiService())
//        let vc = DetailScreenViewController.instantiate()
//        viewModel.coordinator = self
//        vc.title = character.name
//        vc.selectedCharacter = character
//        navigationCoordinator.pushViewController(vc, animated: true)
//    }
//    
//    func didTapSearch() {
//        let viewModel = CharactersViewModel(apiService: MarvelApiService())
//        viewModel.coordinator = self
//        let vc = SearchViewController.instantiate()
//        vc.viewModel = viewModel
//        navigationCoordinator.pushViewController(vc, animated: true)
//    }
//}
