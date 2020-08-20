//
//  ResetPassword.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/04.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct ResetPassword: View {
    @Binding var showModalReset : Bool
    @State private var email : String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                Text("도움이 필요하신가요?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding([.vertical], 20)
                
                Text("비밀번호 재설정 링크 전송을 위해 주문하실 때\n입력하신 고객님의 E-mail을 입력해주세요.")
                    .multilineTextAlignment(.center)
                    .padding([.vertical], 20)
                
                TextField("E-mail", text: $email)
                    .padding(.leading)
                    .padding([.vertical], 20)
                
                Button(action: {
                    checkPayResult().resetPassword(email: self.email)
                }){
                    HStack{
                        Text("비밀번호 재설정 링크 발송하기  ")
                            .foregroundColor(Color.white)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.white)
                    }
                }.frame(minWidth: 0, maxWidth: 300)
                    .padding(15)
                    .background(Color.blue)
                    .cornerRadius(20)
            }.navigationBarTitle(Text("비밀번호 재설정하기"), displayMode: .inline)
            .navigationBarItems(leading: Button("취소"){
                self.showModalReset = false
            })
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword(showModalReset: .constant(true))
    }
}
