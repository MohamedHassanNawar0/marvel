//
//  Config.swift
//  Marvel
//
//  Created by Mohamed Nawar on 8/29/20.
//  Copyright © 2020 Muhammad Hassan Nawar. All rights reserved.
//

struct Config {
    
    struct Keys{
        static let marvelPublic = CommonUtilities.getStringFromMainBundle(key: "MarvelPublicKey")!
        static let marvelPrivate = CommonUtilities.getStringFromMainBundle(key: "MarvelPrivateKey")!
    }
    
    static let baseUrl = CommonUtilities.getStringFromMainBundle(key: "BaseUrl")!
    
    struct TableView {
        
        struct CellIdentifiers {
            static let CharacterCell = "CharacterCell"
            static let ItemCell = "ItemCell"
        }
        
        static var listLoadLimit = 20;
        
    }
    
    struct StorageFilePaths {
        
        private static let characterThumbnailBasePath = StorageFilePaths.fileWithBasePath(file: "characterThumbnails")
        
        private static let resourceComicsBasePath = StorageFilePaths.fileWithBasePath(file: "resourceComics")
        private static let resourceStoriesBasePath = StorageFilePaths.fileWithBasePath(file: "resourceStories")

        static func characterThumbnailPath(name: String) -> String {
            return StorageFilePaths.fileWithBasePath(file: name, basePath: StorageFilePaths.characterThumbnailBasePath)
        }
        
        static func resourceComicsPath(name: String) -> String {
            return StorageFilePaths.fileWithBasePath(file: name, basePath: StorageFilePaths.resourceComicsBasePath)
        }
        static func resourceStoryPath(name: String) -> String {
            return StorageFilePaths.fileWithBasePath(file: name, basePath: StorageFilePaths.resourceStoriesBasePath)
        }

        
        static func fileWithBasePath(file: String, basePath: String = FileStorageUtilities.storageBasePath) -> String {
            return [basePath, file].joined(separator: "/")
        }
    }
    
}
