//
//  Tutorial_2.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/10.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Tutorial_2: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var btnBack : some View{
        Button(action: {self.presentationMode.wrappedValue.dismiss()}){
            Image(systemName: "chevron.left").foregroundColor(Color.white)
        }}
    
    var body: some View {
        ZStack{
            Color.background_blue.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                Image("clock").resizable().frame(width : 200.0, height : 200.0)
                Text("오랫동안 앱을\n사용하지 마세요!")
                    .font(.custom("MaplestoryOTFLight", size: 35))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("부모님과 시간을 약속하고 사용해주세요.")
                    .font(Font.custom("MaplestoryOTFLight", size: 20))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                NavigationLink(destination: Tutorial_Finish()){
                    HStack {
                        Text("다음  ")
                            .foregroundColor(Color.background_blue)
                            .font(Font.custom("MaplestoryOTFLight", size: 20))
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.background_blue)
                        
                    }
                        
                    .frame(minWidth: 0, maxWidth: 200)
                    .padding(15)
                    .background(Color.white)
                    .cornerRadius(40)
                }
                
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            playSound(sound: "Tutorial_2", type: "mp3")
        })
    }
}

struct Tutorial_2_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial_2()
    }
}
