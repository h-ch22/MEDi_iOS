//
//  Tutorial_1.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/14.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Tutorial_1: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var btnBack : some View{
        Button(action: {self.presentationMode.wrappedValue.dismiss()}){
            Image(systemName: "chevron.left").foregroundColor(Color.white)
        }}
    
    var body: some View {
        ZStack{
            Color.background_green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image("kids_2")
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
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        .onAppear(perform: {
            playSound(sound: "Tutorial_1", type: "mp3")
        })
    }
}

struct Tutorial_1_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial_1()
    }
}
