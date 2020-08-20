//
//  Home_Pad.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/17.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let w = rect.size.width
        let h = rect.size.height

        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)

        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)

        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)

        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}

struct Home_Pad: View {
    @State private var showModal = false
    @State public var showFeedbackModal = false

    var body: some View {
        return GeometryReader{ proxy in
            if proxy.size.width < proxy.size.height{
                NavigationView{
                    ZStack(alignment:.top){
                        
                        Color.main.edgesIgnoringSafeArea(.bottom)
                        
                        RoundedCorners(tl:0, tr:0, bl:30, br:30)
                            .fill(Color.violet)
                            .frame(maxWidth : UIScreen.main.bounds.width/2.3, maxHeight : UIScreen.main.bounds.height/2.5, alignment:.top)
                            .edgesIgnoringSafeArea(.top)
                        
                        VStack{
                            HStack {
                                Text("MEDi")
                                    .font(.custom("MaplestoryOTFLight", size: 25))
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth : UIScreen.main.bounds.width/5,
                                           alignment: .leading)
                                
                                Button(action : {self.showModal = true}){
                                    Image("heart").resizable().frame(width : 32, height : 32).foregroundColor(Color.white)
                                }.sheet(isPresented: self.$showModal){
                                    Feedback(showFeedbackModal: self.$showFeedbackModal)
                                    .navigationViewStyle(StackNavigationViewStyle())
                                }
                                
                                Button(action : {self.showModal = true}){
                                    Image("cart").resizable().frame(width : 32, height : 32)
                                }.sheet(isPresented: self.$showModal){
                                    Buy(showModal: self.$showModal).navigationViewStyle(StackNavigationViewStyle())
                                }
                            }
                            
                            Text("오늘은 어떤 것을\n알아볼까요?")
                                .font(.custom("MaplestoryOTFLight", size: 40))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 8,
                                       alignment: .center)
                            
                            Text("원하는 버튼을 선택해보세요!")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 25,
                                       alignment: .center)
                            
                            Spacer().frame(height : 120)
                            
                            ZStack(){
                                HStack {
                                    NavigationLink(destination: Thermometer_start()
                                        .navigationViewStyle(DoubleColumnNavigationViewStyle())){
                                            
                                            Text("체온계")
                                                .foregroundColor(Color.main)
                                                .font(Font.custom("MaplestoryOTFLight", size: 35))
                                                
                                                .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                                
                                                .padding(20)
                                                .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                    }
                                    
                                    
                                    NavigationLink(destination: Mask_start()
                                        .navigationViewStyle(DoubleColumnNavigationViewStyle())){
                                            Text("마스크")
                                                .foregroundColor(Color.main)
                                                .font(Font.custom("MaplestoryOTFLight", size: 35))
                                                
                                                .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                                
                                                .padding(20)
                                                .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                    }
                                }
                                
                                Image("Thermometer")
                                    .resizable().frame(width : 90, height : 40)
                                    .rotationEffect(Angle(degrees: -45))
                                    .position(x:UIScreen.main.bounds.width / 8, y:UIScreen.main.bounds.height / 10)
                                
                                Image("Mask")
                                    .resizable().frame(width : 90, height : 60)
                                    .position(x:UIScreen.main.bounds.width/3.8, y:UIScreen.main.bounds.height / 10)
                            }
                            
                            Spacer().frame(height : 45)
                            
                            ZStack{
                                HStack {
                                    NavigationLink(destination: HandSanitizer_start()){
                                        Text("손소독제")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(20)
                                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                    }
                                    
                                    NavigationLink(destination: Bandage_start()){
                                        Text("밴드")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(20)
                                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                    }
                                }
                                
                                Image("HandSanitizer_large")
                                    .resizable().frame(width : 70, height : 70)
                                    .position(x:UIScreen.main.bounds.width / 8, y:UIScreen.main.bounds.height / 10)
                                
                                Image("Bandage")
                                    .resizable().frame(width : 90, height : 80)
                                    .position(x:UIScreen.main.bounds.width / 3.8, y:UIScreen.main.bounds.height / 10)
                                
                            }
                        }
                        
                    }
                    
                    VStack {
                        Image("kids_1")
                        Spacer().frame(height : 50)
                        Text("원하는 버튼을 눌러\n계속 진행해보세요!").multilineTextAlignment(.center)
                    }

                }.navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
            
            else{
                NavigationView{
                    ZStack(alignment:.top){
                        
                        Color.main.edgesIgnoringSafeArea(.bottom)
                        
                        RoundedCorners(tl:0, tr:0, bl:30, br:30)
                            .fill(Color.violet)
                            .frame(maxWidth : UIScreen.main.bounds.width/3, maxHeight : UIScreen.main.bounds.height/2.5, alignment:.top)
                            .edgesIgnoringSafeArea(.top)
                        
                        VStack{
                            HStack {
                                Text("MEDi")
                                    .font(.custom("MaplestoryOTFLight", size: 25))
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth : UIScreen.main.bounds.width/5,
                                           alignment: .leading)
                                
                                Button(action : {self.showFeedbackModal = true}){
                                    Image("heart").resizable().frame(width : 32, height : 32).foregroundColor(Color.white)
                                }.sheet(isPresented: self.$showFeedbackModal){
                                    Feedback(showFeedbackModal: self.$showFeedbackModal)
                                    .navigationViewStyle(StackNavigationViewStyle())
                                }
                                
                                Button(action : {self.showModal = true}){
                                    Image("cart").resizable().frame(width : 32, height : 32)
                                }.sheet(isPresented: self.$showModal){
                                    Buy(showModal: self.$showModal).navigationViewStyle(StackNavigationViewStyle())
                                }
                            }
                            
                            Text("오늘은 어떤 것을\n알아볼까요?")
                                .font(.custom("MaplestoryOTFLight", size: 35))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 8,
                                       alignment: .center)
                            
                            Text("원하는 버튼을 선택해보세요!")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width,
                                       maxHeight: UIScreen.main.bounds.height / 25,
                                       alignment: .center)
                            
                            Spacer().frame(height : 120)
                            
                            ZStack(){
                                HStack {
                                    NavigationLink(destination: Thermometer_start()
                                        .navigationViewStyle(DoubleColumnNavigationViewStyle())){
                                            
                                            Text("체온계")
                                                .foregroundColor(Color.main)
                                                .font(Font.custom("MaplestoryOTFLight", size: 35))
                                                
                                                .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                                
                                                .padding(20)
                                                .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                    }
                                    
                                    
                                    NavigationLink(destination: Mask_start()
                                        .navigationViewStyle(DoubleColumnNavigationViewStyle())){
                                            Text("마스크")
                                                .foregroundColor(Color.main)
                                                .font(Font.custom("MaplestoryOTFLight", size: 35))
                                                
                                                .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                                
                                                .padding(20)
                                                .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                    }
                                }
                                
                                Image("Thermometer")
                                    .resizable().frame(width : 90, height : 40)
                                    .rotationEffect(Angle(degrees: -45))
                                    .position(x:UIScreen.main.bounds.width / 8, y:UIScreen.main.bounds.height / 40)
                                
                                Image("Mask")
                                    .resizable().frame(width : 90, height : 60)
                                    .position(x:UIScreen.main.bounds.width/3.8, y:UIScreen.main.bounds.height / 40)
                            }
                            
                            Spacer().frame(height : 45)
                            
                            ZStack{
                                HStack {
                                    NavigationLink(destination: HandSanitizer_start()){
                                        Text("손소독제")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(20)
                                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                    }
                                    
                                    NavigationLink(destination: Bandage_start()){
                                        Text("밴드")
                                            .foregroundColor(Color.main)
                                            .font(Font.custom("MaplestoryOTFLight", size: 35))
                                            
                                            .frame(width : UIScreen.main.bounds.width / 6, height : UIScreen.main.bounds.height/12)
                                            
                                            .padding(20)
                                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                    }
                                }
                                
                                Image("HandSanitizer_large")
                                    .resizable().frame(width : 70, height : 70)
                                    .position(x:UIScreen.main.bounds.width / 8, y:UIScreen.main.bounds.height / 40)
                                
                                Image("Bandage")
                                    .resizable().frame(width : 90, height : 80)
                                    .position(x:UIScreen.main.bounds.width / 3.8, y:UIScreen.main.bounds.height / 40)
                                
                            }
                        }
                        
                    }
                    
                    VStack {
                        Image("kids_1")
                        Spacer().frame(height : 50)
                        Text("원하는 버튼을 눌러\n계속 진행해보세요!").multilineTextAlignment(.center)
                    }

                }.navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .onAppear(perform: {
                    playSound(sound: "Home", type: "mp3")
                })
            }
        }

    }
}

struct Home_Pad_Previews: PreviewProvider {
    static var previews: some View {
        Home_Pad()
    }
}
