//
//  Home_Phone.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/17.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct Home_Phone: View {    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>

    var btnBack : some View{
        Button(action: {self.presentationMode.wrappedValue.dismiss()}){
            Image(systemName: "chevron.left").foregroundColor(Color.white)
        }}
    
    var btnStore : some View{
        Button(action : {self.showModal = true}){
            Image("cart").resizable().frame(width : 32, height : 32)
        }.sheet(isPresented: self.$showModal){
            Buy(showModal: self.$showModal)
        }
    }
    
    @State public var showModal = false
    @State var isNavigationBarHidden : Bool = true
    @State public var showFeedbackModal = false
    
    var body: some View {
        return GeometryReader{ proxy in
            if proxy.size.width < proxy.size.height{
                ZStack(alignment:.topLeading){
                    Color.main.edgesIgnoringSafeArea(.bottom)
                    
                    RoundedCorners(tl:0, tr:0, bl:30, br:30)
                        .fill(Color.violet)
                        .frame(maxWidth : UIScreen.main.bounds.width, maxHeight : UIScreen.main.bounds.height/2)
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Spacer().frame(width : 40)
                            Text("MEDi")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                                .frame(maxWidth : UIScreen.main.bounds.width/1.5, alignment: .leading)
                                       
                            Button(action : {self.showFeedbackModal = true}){
                                Image("heart").resizable().frame(width : 32, height : 32).foregroundColor(Color.white)
                            }.sheet(isPresented: self.$showFeedbackModal){
                                Feedback(showFeedbackModal: self.$showFeedbackModal)
                            }
                            
                            Button(action : {self.showModal = true}){
                                Image("cart").resizable().frame(width : 32, height : 32)
                            }.sheet(isPresented: self.$showModal){
                                Buy(showModal: self.$showModal)
                            }
                            
                        }.padding(.trailing, 80)
                        
                        Text("오늘은 어떤 것을\n알아볼까요?")
                            .font(.custom("MaplestoryOTFLight", size: 45))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: UIScreen.main.bounds.width,
                                   maxHeight: UIScreen.main.bounds.height / 4,
                                   alignment: .center)
                        
                        Text("원하는 버튼을 선택해보세요!")
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: UIScreen.main.bounds.width,
                                   maxHeight: UIScreen.main.bounds.height / 25,
                                   alignment: .center)
                        
                        Spacer().frame(height : 100)
                        
                        ZStack(alignment:.center){
                            HStack {
                                NavigationLink(destination: Thermometer_start()
                                    .navigationBarHidden(false)
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarItems(leading: self.btnBack)
                                ){
                                    
                                    Text("체온계")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 2.5, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                }
                                
                                Spacer()
                                                                
                                NavigationLink(destination: Mask_start().navigationBarHidden(false).navigationBarBackButtonHidden(true).navigationBarItems(leading: self.btnBack)){
                                    Text("마스크")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 1.8, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                }
                            }
                            
                            Image("Thermometer")
                                .resizable().frame(width : 90, height : 40)
                                .rotationEffect(Angle(degrees: -45))
                                .position(x:UIScreen.main.bounds.width / 7, y:UIScreen.main.bounds.height / 20)
                            
                            Image("Mask")
                                .resizable().frame(width : 90, height : 60)
                                .position(x:UIScreen.main.bounds.width/1.5, y:UIScreen.main.bounds.height / 30)
                        }
                        
                        Spacer().frame(height : 45)
                        
                        ZStack{
                            HStack {
                                NavigationLink(destination: HandSanitizer_start().navigationBarHidden(false).navigationBarBackButtonHidden(true).navigationBarItems(leading: self.btnBack)){
                                    Text("손소독제")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 2.5, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                                }
                                
                                NavigationLink(destination: Bandage_start().navigationBarHidden(false).navigationBarBackButtonHidden(true).navigationBarItems(leading: self.btnBack)){
                                    Text("밴드")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 1.8, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                                }
                            }
                            
                            Image("HandSanitizer_large")
                                .resizable().frame(width : 70, height : 70)
                                .position(x:UIScreen.main.bounds.width / 7, y:UIScreen.main.bounds.height / 50)
                            
                            Image("Bandage")
                                .resizable().frame(width : 90, height : 80)
                                .position(x:UIScreen.main.bounds.width / 1.5, y:UIScreen.main.bounds.height / 50)
                            
                        }
                    }
                }.navigationBarTitle("", displayMode: .inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
                
            else{
                ZStack(alignment:.topTrailing){
                    Color.main.edgesIgnoringSafeArea(.all)
                    
                    RoundedCorners(tl:0, tr:0, bl:30, br:30)
                        .fill(Color.violet)
                        .frame(maxWidth : UIScreen.main.bounds.width*2, maxHeight : UIScreen.main.bounds.height/3.5)
                    
                    VStack {
                        HStack {
                            Text("MEDi")
                                .font(.custom("MaplestoryOTFLight", size: 25))
                                .foregroundColor(Color.white)
                                .frame(maxWidth : UIScreen.main.bounds.width/1.5, alignment: .leading)
                            
                            Button(action : {self.showFeedbackModal = true}){
                                Image("heart").resizable().frame(width : 32, height : 32).foregroundColor(Color.white)
                            }.sheet(isPresented: self.$showModal){
                                Feedback(showFeedbackModal: self.$showFeedbackModal)
                                .navigationViewStyle(StackNavigationViewStyle())
                            }
                            
                            Button(action : {self.showModal = true}){
                                Image("cart").resizable().frame(width : 32, height : 32)
                            }.sheet(isPresented: self.$showModal){
                                Buy(showModal: self.$showModal)
                            }
                        }
                        Text("오늘은 어떤 것을 알아볼까요?")
                            .font(.custom("MaplestoryOTFLight", size: 30))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: UIScreen.main.bounds.width,
                                   maxHeight: UIScreen.main.bounds.height / 10,
                                   alignment: .center)
                        
                        Text("원하는 버튼을 선택해보세요!")
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: UIScreen.main.bounds.width,
                                   maxHeight: UIScreen.main.bounds.height / 20,
                                   alignment: .center)
                        
                        
                        ZStack(){
                            HStack {
                                NavigationLink(destination: Thermometer_start()
                                    .navigationBarHidden(false)
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarItems(leading: self.btnBack)
                                ){
                                    
                                    Text("체온계")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:30, tr:30, bl:30, br:30).fill(Color.white))
                                }
                                
                                
                                NavigationLink(destination: Mask_start().navigationBarHidden(false).navigationBarBackButtonHidden(true).navigationBarItems(leading: self.btnBack)){
                                    Text("마스크")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:30, tr:30, bl:30, br:30).fill(Color.white))
                                }
                            }
                            
                            Image("Thermometer")
                                .resizable().frame(width : 90, height : 40)
                                .rotationEffect(Angle(degrees: -45))
                                .position(x:UIScreen.main.bounds.width / 5, y:UIScreen.main.bounds.height / 20)
                            
                            Image("Mask")
                                .resizable().frame(width : 90, height : 60)
                                .position(x:UIScreen.main.bounds.width/1.5, y:UIScreen.main.bounds.height / 30)
                        }
                                                
                        ZStack{
                            HStack {
                                NavigationLink(destination: HandSanitizer_start().navigationBarHidden(false).navigationBarBackButtonHidden(true).navigationBarItems(leading: self.btnBack)){
                                    Text("손소독제")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:30, tr:30, bl:30, br:30).fill(Color.white))
                                }
                                
                                NavigationLink(destination: Bandage_start().navigationBarHidden(false).navigationBarBackButtonHidden(true).navigationBarItems(leading: self.btnBack)){
                                    Text("밴드")
                                        .foregroundColor(Color.main)
                                        .font(Font.custom("MaplestoryOTFLight", size: 35))
                                        
                                        .frame(width : UIScreen.main.bounds.width / 3, height : UIScreen.main.bounds.height/12)
                                        
                                        .padding(15)
                                        .background(RoundedCorners(tl:30, tr:30, bl:30, br:30).fill(Color.white))
                                }
                            }
                            
                            Image("HandSanitizer_large")
                                .resizable().frame(width : 70, height : 70)
                                .position(x:UIScreen.main.bounds.width / 5, y:UIScreen.main.bounds.height / 50)
                            
                            Image("Bandage")
                                .resizable().frame(width : 90, height : 80)
                                .position(x:UIScreen.main.bounds.width / 1.5, y:UIScreen.main.bounds.height / 50)
                            
                        }
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

struct Home_Phone_Previews: PreviewProvider {
    static var previews: some View {
        Home_Phone()
    }
}
