//
//  CollectionContainer.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/29/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

import UIKit

class CollectionContainer: BaseContainerViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pagerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pictureCollectionViewController = self.contentViewController as? PictureCollectionViewController{
            pictureCollectionViewController.delegate = self
        }
    }
}

extension CollectionContainer: PictureCollectionViewControllerDelegate{
    func currentPageIndex(page: Int, pagesCount: Int){
        self.pagerLabel.text = "\(page)/\(pagesCount)"
    }
    func currentPageTitle(title: String){
        self.nameLabel.text = title
    }
}
