//
//  Thermometer.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/10.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Mask_start: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var btnBack : some View{
        Button(action: {self.presentationMode.wrappedValue.dismiss()}){
            Image(systemName: "chevron.left").foregroundColor(Color.white)
        }}
    
    init(){
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
    }
    
    var body: some View {
        return GeometryReader{ proxy in
            if proxy.size.width < proxy.size.height{
                ZStack(alignment:.center){
                    Color.main.edgesIgnoringSafeArea(.vertical)
                    
                    if(UIDevice.current.userInterfaceIdiom == .phone){
                        HStack{
                            ZStack{
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .fill(Color.orange)
                                    .rotationEffect(Angle(degrees: 90))
                                    .position(x:0, y:UIScreen.main.bounds.height/2)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 10)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width, y:UIScreen.main.bounds.height / 2)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 5)
                                    .frame(width : 370, height : 370)
                                    .opacity(0.5)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width/0.8, y:UIScreen.main.bounds.height / 2)
                            }
                            
                            
                            
                        }
                    }
                    
                    if(UIDevice.current.userInterfaceIdiom == .pad){
                        HStack{
                            ZStack{
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .fill(Color.orange)
                                    .rotationEffect(Angle(degrees: 90))
                                    .position(x:0, y:UIScreen.main.bounds.height/2)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 10)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width, y:UIScreen.main.bounds.height / 2)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 5)
                                    .frame(width : 500, height : 500)
                                    .opacity(0.5)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width, y:UIScreen.main.bounds.height / 2)
                            }
                            
                            
                            
                        }
                    }
                    
                    
                    VStack(alignment : .center){
                        Spacer().frame(height: 125)
                        
                        Image("Mask").resizable().frame(width: 250, height: 150)
                        
                        
                        Text("마스크")
                            .font(.custom("MaplestoryOTFLight", size: 60))
                            .foregroundColor(Color.white)
                        
                        Text("세균이 입이나 코로\n들어가는 것을 막아줘요!")
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)
                            .frame(height: 100)
                        
                        
                        NavigationLink(destination: Mask_select()){
                            HStack {
                                Text("시작하기")
                                    .foregroundColor(Color.main)
                                    .font(Font.custom("MaplestoryOTFLight", size: 20))
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.main)
                                
                            }
                                
                            .frame(minWidth: 0, maxWidth: 250)
                            .padding(15)
                            .background(Color.white)
                            .cornerRadius(40)
                        }
                    }
                }.navigationViewStyle(StackNavigationViewStyle())
            }
                
            else{
                ZStack(alignment:.center){
                    Color.main.edgesIgnoringSafeArea(.vertical)
                    
                    if(UIDevice.current.userInterfaceIdiom == .phone){
                        HStack{
                            ZStack{
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .fill(Color.orange)
                                    .rotationEffect(Angle(degrees: 90))
                                    .position(x:0, y:UIScreen.main.bounds.height/3.5)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 10)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width/0.55, y:UIScreen.main.bounds.height / 3.5)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 5)
                                    .frame(width : 370, height : 370)
                                    .opacity(0.5)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width/0.5, y:UIScreen.main.bounds.height / 3.5)
                            }
                            
                            
                            
                        }
                        
                        VStack{
                            Spacer().frame(height : 20)
                            Image("Mask")
                                .resizable().frame(width: 170, height: 120)
                                                        
                            Text("마스크")
                                .font(.custom("MaplestoryOTFLight", size: 60))
                                .foregroundColor(Color.white)
                            
                            Text("세균이 입이나 코로 들어가는 것을 막아줘요!")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                            
                            
                            NavigationLink(destination: Mask_select()){
                                HStack {
                                    Text("시작하기")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 20))
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color.main)
                                    
                                }
                                    
                                .frame(minWidth: 0, maxWidth: 250)
                                .padding(15)
                                .background(Color.white)
                                .cornerRadius(40)
                            }
                        }
                    }
                    
                    if(UIDevice.current.userInterfaceIdiom == .pad){
                        HStack{
                            ZStack{
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .fill(Color.orange)
                                    .rotationEffect(Angle(degrees: 90))
                                    .position(x:0, y:UIScreen.main.bounds.height/2)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 10)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width/1.3, y:UIScreen.main.bounds.height / 2)
                                
                                Circle()
                                    .trim(from:0.5, to:1.0)
                                    .stroke(Color.yellow, lineWidth: 5)
                                    .frame(width : 500, height : 500)
                                    .opacity(0.5)
                                    .rotationEffect(Angle(degrees: -90))
                                    .position(x:UIScreen.main.bounds.width/1.3, y:UIScreen.main.bounds.height / 2)
                            }
                            
                            
                            
                        }
                        
                        VStack{
                            Spacer().frame(height: 125)
                            
                            Image("Mask").resizable().frame(width: 170, height: 120)

                            Text("마스크")
                                .font(.custom("MaplestoryOTFLight", size: 60))
                                .foregroundColor(Color.white)
                            
                            Text("세균이 입이나 코로 들어가는 것을 막아줘요!")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                            
                            
                            NavigationLink(destination: Mask_select()){
                                HStack {
                                    Text("시작하기")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 20))
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color.main)
                                    
                                }
                                    
                                .frame(minWidth: 0, maxWidth: 250)
                                .padding(15)
                                .background(Color.white)
                                .cornerRadius(40)
                            }
                        }
                    }
                    
                    
                    
                }.navigationViewStyle(StackNavigationViewStyle())
                .onAppear(perform: {
                    playSound(sound: "mask_intro", type: "mp3")
                })
                
            }
            
        }
        
        
    }
}

struct Mask_start_Previews: PreviewProvider {
    static var previews: some View {
        Mask_start()
    }
}
