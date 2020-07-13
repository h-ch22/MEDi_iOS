//
//  Thermometer.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/10.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Thermometer: View {
    var body: some View {
            NavigationView{
            ZStack(alignment:.topLeading){
                Color.main.edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack{
                        RoundedCorners(tl:0, tr:0, bl:30, br:30)
                            .fill(Color.violet)
                            .frame(width : UIScreen.main.bounds.width, height : UIScreen.main.bounds.height / 2)
                        
                        Text("이제 시작합니다!")
                        .font(.custom("MaplestoryOTFLight", size: 45))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity,
                                maxHeight: UIScreen.main.bounds.height / 2,
                                   alignment: .center)
                    }
                    
                    Spacer()
                    
                    Image("Thermometer")
                        .resizable()
                        .frame(width : 170, height : 60)
                        .rotationEffect(Angle(degrees: -45))
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(destination: Thermometer()){
                            Text("사용법 보기")
                            .foregroundColor(Color.main)
                            .font(Font.custom("MaplestoryOTFLight", size: 30))

                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/8)
                                
                            .padding(15)
                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                        }
                        
                        NavigationLink(destination: Tutorial_Finish()){
                            Text("직접 해보기")
                            .foregroundColor(Color.main)
                            .font(Font.custom("MaplestoryOTFLight", size: 30))

                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/8)
                                
                            .padding(15)
                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                        }
                    }
                    
                }
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct Thermometer_Previews: PreviewProvider {
    static var previews: some View {
        Thermometer()
    }
}
