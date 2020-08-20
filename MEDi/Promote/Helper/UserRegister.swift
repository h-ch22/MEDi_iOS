//
//  UserRegister.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/03.
//  Copyright © 2020 MEDi. All rights reserved.
//

import Foundation
import Firebase

class UserRegister{
    var registerResult : Bool = false
    
    func register(email: String, password: String, name: String) -> Bool{
        Auth.auth().createUser(withEmail: email, password: password){
            authResult, error in
            guard let user = authResult?.user else{return}
            
            if error == nil{
                print("register successed")
                self.registerResult = true
                
                return
            }
            
            else{
                print(error)
                
                Auth.auth().fetchProviders(forEmail: email, completion: {
                    (providers, error) in
                    
                    if let error = error{
                        print(error.localizedDescription)
                        
                        self.registerResult = false
                    }
                    
                    else if let providers = providers{
                        print(providers)
                        
                        self.registerResult = true
                    }
                    
                    else{
                        self.registerResult = false
                    }
                })
                
                return
            }
            
        }
        
        return registerResult
    }
}
