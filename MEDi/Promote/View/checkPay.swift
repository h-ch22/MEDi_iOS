//
//  checkPay.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/29.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

public class showModal{
    public var showModalResult : Bool = false
    public var email : String = ""
    public static let shared = showModal()
}

struct checkPay: View {
    @State var Email : String = ""
    @State var pw : String = ""
    @Binding var showModalCheck : Bool
    @State var showModalReset : Bool = false
    @State var showModalResult : Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("안녕하세요, 고객님.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("계속하려면 결제 시 입력했던\n고객님의 정보를 입력해주세요.")
                    .multilineTextAlignment(.center)
                
                TextField("E-mail", text: $Email)
                    .padding()
                    .padding([.vertical], 20)
                
                SecureField("결제정보 확인용 비밀번호", text: $pw)
                    .padding()
                    .padding([.vertical], 20)
                                
                Button(action: {
                    checkPayResult().checkUser(email: self.Email, pw: self.pw)
                    showModal.shared.email = self.Email
                    
                    if showModal.shared.showModalResult == true{
                        self.showModalResult = true
                    }
                }) {
                    HStack{
                        Text("결제 정보 확인하기")
                            .foregroundColor(Color.white)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.white)
                    }
                }.frame(minWidth: 0, maxWidth: 200)
                    .padding(15)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .sheet(isPresented: self.$showModalResult){
                        showResult(showModalResult : self.$showModalResult).navigationViewStyle(StackNavigationViewStyle())
                }
                
                Spacer().frame(height : 20)
                
                Button(action: {
                    self.showModalReset = true
                }) {
                    Text("비밀번호를 잊으셨나요?")
                        .foregroundColor(Color.blue)
                }.sheet(isPresented: self.$showModalReset){
                        ResetPassword(showModalReset : self.$showModalReset).navigationViewStyle(StackNavigationViewStyle())
                }
            }.navigationBarTitle(Text("결제정보 확인하기"), displayMode: .inline)
            .navigationBarItems(leading: Button("취소"){
                self.showModalCheck = false
            })
        }

    }
}

struct checkPay_Previews: PreviewProvider {
    static var previews: some View {
        checkPay(showModalCheck: .constant(true))
    }
}
