//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Dewa Prabawa on 25/08/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    static var shared = AuthManager()
    
    public func registerNewUser(username: String, email:String, password:String, completion:@escaping (Bool)-> Void){
        /*
         - Check if username whether available
         - Check if email wheter available
         */
        
        DataBaseManager.shared.canCreateNewUser(with: email, username: username) { (success) in
            if success {
                /*
                 - Create account
                 - Insert account into database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { (authRes, error) in
                    guard error == nil, authRes != nil else {
                        completion(false)
                        return
                    }
                    ///Insert into database
                    DataBaseManager.shared.insertNewUser(with: email, username: username) { (success) in
                        if success {
                            ///Succeded inserting data to database
                            completion(true)
                            return
                        }else{
                            ///Failed inserting data to database
                            completion(false)
                            return
                        }
                    }
                }
            }else{
                /// either username or email does not  exits
                
            }
        }
    }
      
    public func loginUser(username:String?, email:String?, password:String, completion:@escaping (Bool) -> Void){
        /// log in via email
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { (AuthResponse, error) in
                guard AuthResponse != nil, error == nil else  {
                    completion(false)
                    return
                }
                completion(true)
            }
        /// log in via username
        }else if let username = username {
            print(username)
            
            
        }
    }
    
    /*
     - attempting to sign out and passing boolean to setting view controller
     */
      
    public func signOutUser(completion:@escaping (Bool) -> Void){
        do{
            try Auth.auth().signOut()
            completion(true)
            return
        }catch{
            completion(false)
            fatalError("failed to log out")
        }
    }
}
