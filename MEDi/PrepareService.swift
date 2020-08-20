//
//  PrepareService.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/18.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct PrepareService: View {
    @State public var showFeedbackModal = false

    var body: some View {
        VStack {
            HStack {
                Text("MEDi")
                .font(.custom("MaplestoryOTFLight", size: 25))
                    .padding(30)
                
                Spacer()
            }
            
            Spacer()
            
            Image("kids_3")
                .resizable()
                .frame(width : 150, height: 250)
            Text("서비스 준비 중입니다.")
                .font(.custom("MaplestoryOTFLight", size: 35))
            
            Spacer()
            
            Button(action: {
                self.showFeedbackModal = true
            }) {
                HStack {
                    Text("사용자 의견 보내기")
                        .foregroundColor(Color.white)
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.white)
                        .frame(width : 30, height : 30)
                }
            }.frame(minWidth: 0, maxWidth: 200)
                .padding(15)
                .background(Color.blue)
                .cornerRadius(15)
                .sheet(isPresented: self.$showFeedbackModal){
                    Feedback(showFeedbackModal: self.$showFeedbackModal).navigationViewStyle(StackNavigationViewStyle())
            }
            
            Spacer()
        }
    }
}

struct PrepareService_Previews: PreviewProvider {
    static var previews: some View {
        PrepareService()
    }
}
