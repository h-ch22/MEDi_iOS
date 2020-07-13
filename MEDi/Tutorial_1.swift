//
//  Tutorial_1.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/10.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Tutorial_1: View {
    var body: some View {
            NavigationView{
            ZStack{
                Color.background_green.edgesIgnoringSafeArea(.all)
                
            VStack {
                Spacer()
                Image("kids_1")
                Text("앱을 사용할 때\n뒤로 걷지 마세요!")
                    .font(.custom("MaplestoryOTFLight", size: 35))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("안전사고의 위험이 있어요.")
                    .font(Font.custom("MaplestoryOTFLight", size: 20))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                NavigationLink(destination: Tutorial_2()){
                    HStack {
                            Text("다음  ")
                            .foregroundColor(Color.background_green)
                            .font(Font.custom("MaplestoryOTFLight", size: 20))

                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.background_green)

                        }

                    .frame(minWidth: 0, maxWidth: 200)
                    .padding(15)
                    .background(Color.white)
                    .cornerRadius(40)
                }
                
                Spacer()
            }
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct Tutorial_1_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial_1()
    }
}
