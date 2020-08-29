//
//  CharactersTableViewController.swift
//  Marvelo
//
//  Created by Muhammad Hassan on 11/27/17.
//  Copyright © 2020 Nawar. All rights reserved.
//

import UIKit

class CharactersTableViewController: ImageReusableTableViewController<Character, CharacterCell> {
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        super.viewDidLoad()
    }
    
    override func cellIdentifier(forIndexPath indexPath: IndexPath) -> String {
        return Config.TableView.CellIdentifiers.CharacterCell
    }
    
    override func inflateCell(cell: CharacterCell, forObject object: Character, atIndexPath indexPath: IndexPath) {
        
        if(cell.backgroundView == nil){
            let imageView = UIImageView()
            imageView.contentMode = UIView.ContentMode.center
            cell.backgroundView = imageView
            cell.backgroundColor = UIColor.clear
        }
        
        super.inflateCell(cell: cell, forObject: object, atIndexPath: indexPath)
        cell.nameLabel.text = object.name
        
    }
    
    override func getImageHashForObject(object: Character, atIndexPath indexPath: IndexPath)->Int{
        return object.hashValue
    }
    
    override func imageViewsForCell(cell: UITableViewCell, andObject object: Character, indexPath: IndexPath) -> [UIImageView] {
        if let imageViews = imageDelegate?.imageViewsForCell(cell: cell, andObject: object, indexPath: indexPath){
            return imageViews
        }
        return [cell.backgroundView as! UIImageView]
    }
    
    
    
    override func image(imageView: UIImageView, object: Character, indexPath: IndexPath, completionHandler: @escaping (UIImage?) -> Void) -> UIImage? {
        
        //try to download image
        if let localImage = Request.getCharacterThumbnail(character: object, saveLocally: true, completionHandler: completionHandler) {
            return localImage
        }
        
        return super.image(imageView: imageView, object: object, indexPath: indexPath, completionHandler: completionHandler)
    }
    
}
