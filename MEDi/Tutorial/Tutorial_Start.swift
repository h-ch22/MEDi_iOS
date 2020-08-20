//
//  ContentView.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/04.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    
    static let screenHeight = UIScreen.main.bounds.size.height
}

extension Color{
    static let background = Color("BG_Yellow")
    static let background_green = Color("BG_Green")
    static let background_blue = Color("BG_Blue")
    static let background_red = Color("BG_Red")
    static let main = Color("main")
    static let violet = Color("violet")
    static let Red = Color("Red")
    static let borderGR_start = Color("GR_Start")
    static let borderGR_end = Color("GR_End")
    static let buttonGR_start = Color("Btn_start")
    static let buttonGR_end = Color("Btn_End")
    static let buttonGR = LinearGradient(gradient: Gradient(colors: [Color.buttonGR_start, Color.buttonGR_end]), startPoint: .leading, endPoint: .trailing)
}


struct Tutorial_Start: View {
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack(alignment:.top){
                Color.background.edgesIgnoringSafeArea(.all)

                VStack(alignment:.center) {
                    Spacer()
                    
                    Image("kids_1")
                    
                    Text("반가워요!")
                        .font(.custom("MaplestoryOTFLight", size: 45))
                        .foregroundColor(Color.white)
                    
                    Text("시작하기 전에,\n주의사항에 대해 알아볼까요?")
                        .font(Font.custom("MaplestoryOTFLight", size: 25))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height / 25)
                    
                    NavigationLink(destination: Tutorial_1()){
                        HStack {
                                Text("시작하기  ")
                                .foregroundColor(Color.Red)
                                .font(Font.custom("MaplestoryOTFLight", size: 20))

                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.Red)

                            }

                        .frame(minWidth: 0, maxWidth: 200)
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(40)
                    }
                    
                    Spacer()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            playSound(sound: "Tutorial_Start", type: "mp3")
        })
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        Tutorial_Start()
    }
}
