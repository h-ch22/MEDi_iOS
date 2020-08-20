//
//  saveUserData.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/03.
//  Copyright © 2020 MEDi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class saveUserData{
    func sendUserData(name: String, phone: String, dollName: String, date: String, email: String, address: String, isSet: Bool) -> Void{
        var db : Firestore!
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        db.collection("User").document(email).setData([
            "name" : name,
            "email" : email,
            "phone" : phone,
            "address" : address,
            "dollName" : dollName,
            "date" : date,
            "isSet" : isSet
        ]){ err in
            if let err = err{
                print("Error : \(err)")
            }
            
            else{
                print("save data success.")
            }
            
        }
    }
    
    func uploadImage(name: String, date: String, withImage: UIImage) -> Void{
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let imagesRef = storageRef.child(name)
        var dollRef = storageRef.child("\(name)/\(date).jpg")
        let storagePath = "gs://medi-f1c5a.appspot.com/\(name)/\(date).jpg"
        
        dollRef = storage.reference(forURL: storagePath)
        
        guard let data = withImage.jpegData(compressionQuality: 1) else{return}
        let uploadTask = dollRef.putData(data, metadata: nil){(metadata, error) in
            guard let metadata = metadata else{
                print(error)
                return
            }
        }
    }
}
