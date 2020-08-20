//
//  getUserData.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/05.
//  Copyright © 2020 MEDi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class getUserData{
    public var name : String = ""
    public var date : String = ""
    public var isSet : Bool = false
    public var dollName : String = ""
    
    func getUserInfo(email: String){
        var db : Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        let reference = db.collection("User").document(email)
        
        reference.getDocument{(DocumentSnapshot, error) in
            if let error = error{
                
            }
            
            else if let DocumentSnapshot = DocumentSnapshot, DocumentSnapshot.exists{
                if let documentData = DocumentSnapshot.data(){
                }
            }
        }
    }
    
    func getDollImage(name: String){
        
    }
}
