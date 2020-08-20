//
//  checkCode.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/04.
//  Copyright © 2020 MEDi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

struct checkCodeVariable{
    static var isUsed : String = ""
    static var result : String = ""
    static var discount : Int = 0
}

class checkCode{
    var db: Firestore!
    let settings = FirestoreSettings()
    
    func checkCode(code: String) -> Void{
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        let docRef = db.collection("PromotionCode").document(code)
        let code : String = code
        
        docRef.getDocument{(document, error) in
            if let document = document, document.exists{
                checkCodeVariable.isUsed = document.get("isUsed") as! String
                
                if checkCodeVariable.isUsed == "false"{
                    checkCodeVariable.result = "success"
                    self.getDiscount(code: code)
                }
                
                if checkCodeVariable.isUsed == "true"{
                    checkCodeVariable.result = "used"
                }
            }
                
            else{
                checkCodeVariable.result = "noCode"
            }
        }
    }
    
    func getDiscount(code: String) -> Void{
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        let docRef = db.collection("PromotionCode").document(code)
        
        docRef.getDocument{(document, error) in
            if let document = document, document.exists{
                checkCodeVariable.discount = document.get("discount") as! Int
            }
        }
    }
}
