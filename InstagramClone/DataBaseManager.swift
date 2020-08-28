//
//  DataBaseManager.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import FirebaseDatabase


public class DataBaseManager {
    static var shared = DataBaseManager()
    
    private let ref = Database.database().reference()
    
    //MARK: Public
    
    /// Check whether username and email available
    /// - Parameters
    ///     -email: String representing email
    ///     -username: String representing username
    
    public func canCreateNewUser(with email:String, username:String, completion: (Bool)-> Void){
        completion(true)
    }
    
    /// Insert new user data to database
    /// - Parameters
    ///     -email: String representing email
    ///     -username: String representing username
    ///     -completion: async callback if the datan entry succeeded
    public func insertNewUser(with email: String, username: String, completion:@escaping (Bool) -> Void){
        let key = email.safeDatabaseKey()
        ref.child(key).setValue(["username":username]){error, _ in
            if error == nil {
                ///Succeeded
                completion(true)
                return
            }else{
                ///Failed
                completion(false)
                return
            }
        }
    }
  
}
