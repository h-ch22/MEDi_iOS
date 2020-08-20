//
//  Buy_Success.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/22.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Buy_Success: View {
    @Binding var showModalSuccess : Bool
    
    var body: some View {
        VStack{
            ZStack{
                Circle().fill(Color.green).frame(width:100, height:100)
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 35, height: 30)
                    .foregroundColor(Color.white)
            }
            Text("주문해주셔서 감사합니다.")
                .font(.largeTitle)
            Text("제품이 마음에 드시기를 바랍니다.")
        }.navigationBarTitle(Text("결제 완료"), displayMode: .inline)
        .navigationBarItems(leading: Button("닫기"){
            self.showModalSuccess = false
        })
    }
}

struct Buy_Success_Previews: PreviewProvider {
    static var previews: some View {
        Buy_Success(showModalSuccess: .constant(true))
    }
}
