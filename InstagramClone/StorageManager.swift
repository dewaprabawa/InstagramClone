//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import FirebaseStorage

public class StorageManager{
    static var shared = StorageManager()
    
    private var bucket = Storage.storage().reference()
    
    public enum IGStorageManagerError: Error {
        case failedToDownload
    }
    
    public func uploadUserPost(with model: UserPost, completion:@escaping (Result<URL, IGStorageManagerError>) -> Void ){
        
    }
    
    public func downloadImage(with reference: String, completion:@escaping (Result<URL, IGStorageManagerError>) -> Void){
        bucket.child(reference).downloadURL { (url, error) in
            guard let url = url, error == nil else {
                completion(.failure(.failedToDownload))
                return
            }
            
            completion(.success(url))
        }
    }
}

public enum UserPostType {
    case video
    case image
}

public struct UserPost{
    let postType: UserPostType
}
