//
//  CharactersIndexViewController.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/29/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import UIKit

class CharactersIndexViewController: BaseContainerViewController {
    
    var searchController: UISearchController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
    }
    
    override func viewDidLoad() {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
        self.navigationItem.titleView = imageView

        if let charactersTableViewController = self.contentViewController as? CharactersTableViewController{
            charactersTableViewController.delegateDataSource = self
            charactersTableViewController.delegate = self
        }
        
        let searchItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(showSearch(sender:)))
        self.navigationItem.rightBarButtonItem = searchItem
        
        
        let charactersSearchResultsController = UIStoryboard.charactersSearchResultsController()
        
        charactersSearchResultsController.delegate = self
        
        self.searchController = UISearchController(searchResultsController: UINavigationController(rootViewController: charactersSearchResultsController) )
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = charactersSearchResultsController
        self.searchController.searchBar.barStyle = UIBarStyle.black
        self.searchController.searchBar.tintColor = UINavigationBar.appearance().tintColor
        self.searchController.searchBar.isTranslucent = false
        
        
        super.viewDidLoad()
        
    }
    
    @IBAction func showSearch(sender: UIBarButtonItem) {
        self.present(self.searchController, animated: true, completion: nil)
    }
}


extension CharactersIndexViewController: ReusableTableViewControllerDataSourceDelegate{
    func dataWithLimit(limit: Int, offset: Int, completionHandler: @escaping (_ objects: Array<Any>?) -> Void) {
        
        ApiManager.request.getCharachterIndex(limit: limit, offset: offset) { (ok, objects, error) in
            completionHandler(objects)
        }
    }
    
    private func inflateCell(cell: UITableViewCell, object: Any, indexPath: NSIndexPath) {
        if let characterCell = cell as? CharacterCell{
            characterCell.photoImageView?.image =  UIImage(named: "ImageCellTitle")
        }
    }
}


extension CharactersIndexViewController: CharactersSearchResultsControllerDelegate{
    func didSelectCharacter(character: Character) {
        self.navigationController?.pushViewController(UIStoryboard.detailsTableViewController(character: character), animated: true)
    }
    func changeSearchBarVisibility(visible: Bool){
        self.searchController.searchBar.isHidden = !visible
        self.searchController.view.endEditing(true)
    }
}

extension CharactersIndexViewController: ReusableTableViewControllerDelegate{
    func didSelectObject(object: Any, atIndexPath indexPath: IndexPath) {
        if let character = object as? Character{
            self.navigationController?.pushViewController(UIStoryboard.detailsTableViewController(character: character), animated: true)
        }
    }
}
