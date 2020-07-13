//
//  Tutorial_Finish.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/10.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Tutorial_Finish: View {
    var body: some View {
            NavigationView{
            ZStack{
                Color.background_red.edgesIgnoringSafeArea(.all)
                
            VStack {
                Spacer()
                Image("kids_1")
                Text("모두 완료!")
                    .font(.custom("MaplestoryOTFLight", size: 35))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                
                
                Text("당신을 만날 준비가 완료되었어요.")
                    .font(Font.custom("MaplestoryOTFLight", size: 20))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                NavigationLink(destination: Home()){
                    HStack {
                            Text("시작하기  ")
                            .foregroundColor(Color.background_red)
                            .font(Font.custom("MaplestoryOTFLight", size: 20))

                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.background_red)

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

struct Tutorial_Finish_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial_Finish()
    }
}
