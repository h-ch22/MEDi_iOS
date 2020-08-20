//
//  showResult.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/05.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI


struct showResult: View {
    @Binding var showModalResult : Bool
    @State var email : String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                Text("\(showModal.shared.email) 고객님의 결제 내역입니다.")
                
            }.navigationBarTitle(Text("결제 내역"), displayMode: .inline)
            .navigationBarItems(leading: Button("취소"){
                self.showModalResult = false
            })
        }
    }
}

struct showResult_Previews: PreviewProvider {
    static var previews: some View {
        showResult(showModalResult: .constant(true))
    }
}
