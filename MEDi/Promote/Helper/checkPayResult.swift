//
//  checkPayResult.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/04.
//  Copyright © 2020 MEDi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

class checkPayResult{
    var checkPay_ = checkPay(showModalCheck: .constant(true))
    
    func checkUser(email: String, pw: String) -> Void{
        Auth.auth().signIn(withEmail: email, password: pw){[weak self] authResult, error in
            if let error = error{
                let authError = error as NSError
                
                print("error\(error)")
            }
            
            else{
                showModal.shared.showModalResult = true
                print("sign in success")
            }
        }
    }
    
    func resetPassword(email: String) -> Void{
        Auth.auth().sendPasswordReset(withEmail: email){error in
            if let error = error{
                print("error\(error)")
            }
            
            else{
                print("send email success")
            }
        }
    }
}
