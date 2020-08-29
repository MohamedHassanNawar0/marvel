//
//  CharacterSearchResultsController.swift
//  Marvelo
//
//  Created by Muhammad Hassan on 11/27/17.
//  Copyright © 2020 Nawar. All rights reserved.
//

import UIKit


protocol CharactersSearchResultsControllerDelegate{
    func didSelectCharacter(character: Character)
    func changeSearchBarVisibility(visible: Bool)
}

class CharactersSearchResultsController: BaseContainerViewController {
    
    var delegate:CharactersSearchResultsControllerDelegate?
    
    var searchText: String = ""
    
    override func viewDidLoad() {
        
        if let charactersTableViewController = self.contentViewController as? CharactersTableViewController{
            charactersTableViewController.delegateDataSource = self
            charactersTableViewController.delegate = self
        }
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsWhenKeyboardAppears = true
        self.delegate?.changeSearchBarVisibility(visible: true)
    }
    
}


extension CharactersSearchResultsController: ReusableTableViewControllerDataSourceDelegate{
    func dataWithLimit(limit: Int,
                       offset: Int,
                       completionHandler: @escaping(_ objects: Array<Any>?) -> Void) {
        APIManager.request.getCharachterSearch(text: self.searchText, limit: limit, offset: offset) { (ok, objects, error) in
            completionHandler(objects)
        }
    }
    
    func setupTableView(tableView: UITableView) {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
}


extension CharactersSearchResultsController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        
        if let charactersTableViewController = self.contentViewController as? CharactersTableViewController{
            charactersTableViewController.load()
        }
    }
    
}



extension CharactersSearchResultsController: ReusableTableViewControllerDelegate{
    func didSelectObject(object: Any, atIndexPath indexPath: IndexPath) {
        if let character = object as? Character{
            self.delegate?.changeSearchBarVisibility(visible: false)
            self.navigationController?.pushViewController(UIStoryboard.detailsTableViewController(character: character), animated: true)
        }
    }
}
