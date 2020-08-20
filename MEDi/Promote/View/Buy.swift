//
//  Buy.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/14.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Buy: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var showModalForm = false
    @State private var showModalCheck = false
    @Binding var showModal : Bool

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Image("buyPromote").resizable().frame(width: 300, height: 300, alignment: .top)
                    Text("가지고 있는 피규어에 알맞는\n의약외품 키트를 구매해보세요!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height : 40)

                    Button(action: {self.showModalForm = true}) {
                        HStack{
                            Text("구매 신청하기")
                                .foregroundColor(Color.white)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.white)
                        }
                    }.frame(minWidth: 0, maxWidth: 200)
                        .padding(15)
                        .background(Color.blue)
                        .cornerRadius(20)
                        .sheet(isPresented: self.$showModalForm){
                            PromoteForm(showModalForm : self.$showModalForm).navigationViewStyle(StackNavigationViewStyle())
                    }
                    
                    Spacer().frame(height : 20)
                    
                    Button(action: {self.showModalCheck = true}) {
                        HStack{
                            Text("결제 정보 확인 및 복원하기")
                                .foregroundColor(Color.blue)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.blue)
                        }
                    }.frame(minWidth: 0, maxWidth: 200)
                        .padding(15)
                    .sheet(isPresented: self.$showModalCheck){
                            checkPay(showModalCheck : self.$showModalCheck).navigationViewStyle(StackNavigationViewStyle())
                    }
                    
                }
            }
            .navigationBarTitle(Text("기능 추가하기"), displayMode: .inline)
            .navigationBarItems(leading: Button("취소"){
                self.showModal = false
            })
        }
        
    }
}

struct Buy_Previews: PreviewProvider {
    static var previews: some View {
        Buy(showModal : .constant(true))
    }
}
