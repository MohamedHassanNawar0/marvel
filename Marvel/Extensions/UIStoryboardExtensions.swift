//
//  String.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/28/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    internal class func charactersTableViewController() -> CharactersTableViewController {
        //When the storyboarding class is loaded at runtime, the [.*]Class is referenced using a string.
        //The linker doesn't analyze code functionality, so it doesn't know that the class is used. Since no other source files references that class, the linker optimizes it out of existence when making the executable.
        CharactersTableViewController.hash()
        return mainStoryboard().instantiateViewController(withIdentifier: "CharactersTableViewController") as! CharactersTableViewController
        
    }
    
    
    internal class func searchCharactersViewController() -> CharactersTableViewController {
        CharactersTableViewController.hash()
        return mainStoryboard().instantiateViewController(withIdentifier: "SearchCharactersViewController") as! CharactersTableViewController
    }
    
    internal class func charactersSearchResultsController() -> CharactersSearchResultsController {
        return CharactersSearchResultsController(viewController: self.searchCharactersViewController())
    }
    
    
    
    internal class func charactersIndexViewController() -> CharactersIndexViewController {
        return CharactersIndexViewController(viewController: self.charactersTableViewController())
    }
    
    internal class func pictureCollectionViewController(character: Character) -> PictureCollectionViewController {
        let vc = mainStoryboard().instantiateViewController(withIdentifier: "PictureCollectionViewController") as! PictureCollectionViewController
        vc.character = character
        return vc
        
    }
    
    
    internal class func collectionContainer(character: Character) -> CollectionContainer {
        let vc = mainStoryboard().instantiateViewController(withIdentifier: "CollectionContainer") as! CollectionContainer
        let pvc = self.pictureCollectionViewController(character: character)
        pvc.enableCloseButton = true
        vc.contentViewController = pvc
        return vc
        
    }
    
    internal class func detailsTableViewController(character: Character) -> DetailsTableViewController {
        let vc = mainStoryboard().instantiateViewController(withIdentifier: "DetailsTableViewController") as! DetailsTableViewController
        vc.character = character
        return vc
        
    }
    
    
}
