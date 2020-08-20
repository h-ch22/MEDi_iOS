//
//  Thermometer_select.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/14.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct Thermometer_select: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var btnBack : some View{
        Button(action: {self.presentationMode.wrappedValue.dismiss()}){
            Image(systemName: "chevron.left").foregroundColor(Color.white)
        }}
    
    var body: some View {
        return GeometryReader{ proxy in
            if proxy.size.width < proxy.size.height{
                ZStack(alignment:.top){
                    Color.main.edgesIgnoringSafeArea(.bottom)
                    
                    RoundedCorners(tl:0, tr:0, bl:30, br:30)
                        .fill(Color.violet)
                        .frame(maxWidth : UIScreen.main.bounds.width, maxHeight : UIScreen.main.bounds.height/2.5, alignment:.top)
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        
                        if(UIDevice.current.userInterfaceIdiom == .phone){
                            Text("이제 시작합니다!")
                                .font(.custom("MaplestoryOTFLight", size: 45))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 5,
                                       alignment: .center)
                            
                            Text("원하는 버튼을 선택해보세요!")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 25,
                                       alignment: .center)
                                
                                .position(x:UIScreen.main.bounds.width/2, y:30)
                            
                            Image("Thermometer")
                                .resizable()
                                .frame(width : 250, height : 60)
                                .rotationEffect(Angle(degrees: -45))
                            
                            ZStack(){
                                HStack {
                                    NavigationLink(destination: Thermometer_start()){
                                        Text("사용법 보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 30))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(10)
                                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                            .position(x:UIScreen.main.bounds.width/5, y : UIScreen.main.bounds.height/4.5)
                                    }
                                    
                                    
                                    NavigationLink(destination: Mask_start()){
                                        Text("직접 해보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 30))
                                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(10)
                                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                            .position(x:UIScreen.main.bounds.width/3.5, y : UIScreen.main.bounds.height/4.5)
                                    }
                                }
                                
                                HStack {
                                    Image("HOW-TO")
                                        .resizable()
                                        .frame(width : 70, height : 70)
                                        .position(x: UIScreen.main.bounds.width / 9,
                                                  y: UIScreen.main.bounds.height / 6.8)
                                                                
                                    Image("TO-DO")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .position(x: UIScreen.main.bounds.width / 7,
                                                  y: UIScreen.main.bounds.height / 6.8)
                                }
                            }
                            
                        }
                        
                        if(UIDevice.current.userInterfaceIdiom == .pad){
                            Text("이제 시작합니다!")
                                .font(.custom("MaplestoryOTFLight", size: 60))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 4,
                                       alignment: .center)
                            
                            Text("원하는 버튼을 선택해보세요!")
                                .font(.custom("MaplestoryOTFLight", size: 40))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 12,
                                       alignment: .center)
                            
                            
                            Image("Thermometer")
                                .resizable()
                                .frame(width : 250, height : 60)
                                .rotationEffect(Angle(degrees: -45))
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 4)

                            
                            
                            Spacer().frame(height : 300)
                            
                            ZStack(){
                                HStack {
                                    NavigationLink(destination: Thermometer_start()){
                                        Text("사용법 보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/7)
                                            
                                            .padding(15)
                                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                    }
                                    
                                    
                                    NavigationLink(destination: Mask_start()){
                                        Text("직접 해보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/7)
                                            
                                            .padding(15)
                                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                    }
                                }
                                
                                HStack {
                                    Image("HOW-TO")
                                        .resizable()
                                        .frame(width : 70, height : 70)
                                        .position(x: UIScreen.main.bounds.width / 9,
                                                  y: UIScreen.main.bounds.height / 14.8)
                                                                
                                    Image("TO-DO")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .position(x: UIScreen.main.bounds.width / 7,
                                                  y: UIScreen.main.bounds.height / 14.8)
                                }
                            }
                        }
                    }
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: self.btnBack)        }.navigationViewStyle(StackNavigationViewStyle())
            }
                
            else{
                ZStack(alignment:.top){
                    Color.main.edgesIgnoringSafeArea(.bottom)
                    
                    RoundedCorners(tl:0, tr:0, bl:30, br:30)
                        .fill(Color.violet)
                        .frame(maxWidth : UIScreen.main.bounds.width, maxHeight : UIScreen.main.bounds.height/2.5, alignment:.top)
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        
                        if(UIDevice.current.userInterfaceIdiom == .phone){
                            Text("이제 시작합니다!")
                                .font(.custom("MaplestoryOTFLight", size: 45))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 5,
                                       alignment: .center)
                            
                            Text("원하는 버튼을 선택해보세요!")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 25,
                                       alignment: .center)
                                
                                .position(x:UIScreen.main.bounds.width/2, y:30)
                            
                            Image("Thermometer")
                                .resizable()
                                .frame(width : 250, height : 60)
                                .rotationEffect(Angle(degrees: -45))
                            
                            ZStack(){
                                HStack {
                                    NavigationLink(destination: Thermometer_start()){
                                        Text("사용법 보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 30))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(10)
                                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                            .position(x:UIScreen.main.bounds.width/5, y : UIScreen.main.bounds.height/4.5)
                                    }
                                    
                                    
                                    NavigationLink(destination: Mask_start()){
                                        Text("직접 해보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 30))
                                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(10)
                                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                            .position(x:UIScreen.main.bounds.width/3.5, y : UIScreen.main.bounds.height/4.5)
                                    }
                                }
                            }
                            
                        }
                        
                        if(UIDevice.current.userInterfaceIdiom == .pad){
                            Text("이제 시작합니다!")
                                .font(.custom("MaplestoryOTFLight", size: 60))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 4,
                                       alignment: .center)
                            
                            Text("원하는 버튼을 선택해보세요!")
                                .font(.custom("MaplestoryOTFLight", size: 40))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 12,
                                       alignment: .center)
                            
                            Spacer().frame(height : 200)
                            
                            Image("Thermometer")
                                .resizable()
                                .frame(width : 250, height : 60)
                                .rotationEffect(Angle(degrees: -45))
                            
                            Spacer().frame(height : 100)
                            
                            ZStack(){
                                HStack {
                                    NavigationLink(destination: Thermometer_start()){
                                        Text("사용법 보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(15)
                                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                    }
                                    
                                    
                                    NavigationLink(destination: Mask_start()){
                                        Text("직접 해보기")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(15)
                                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .navigationBarHidden(false)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: self.btnBack)        }.navigationViewStyle(StackNavigationViewStyle())
            }
            
        }
    }
}

struct Thermometer_select_Previews: PreviewProvider {
    static var previews: some View {
        Thermometer_select()
    }
}