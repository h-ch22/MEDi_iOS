//
//  MaskTODO_1.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/30.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI
import UIKit

struct MaskTODO_1: View {
    @State public var isMaskSelected : Bool = false
    @State public var isThermometerSelected : Bool = false
    @State public var isBandageSelected : Bool = false
    @State public var isHandSanitizerSelected : Bool = false
    @State public var screenSize : Int = Int(UIScreen.main.bounds.width * UIScreen.main.bounds.height)
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack{
                if(!self.isMaskSelected == true){
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 3.5)
                    .opacity(0.8)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.background, lineWidth : 2))
                }
                
                if(self.isMaskSelected == true){
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 8)
                    .opacity(0.8)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.background, lineWidth : 2))
                }
                
                VStack{
                    if(self.isThermometerSelected == false && self.isBandageSelected == false && self.isHandSanitizerSelected == false && self.isMaskSelected == false){
                        
                        Text("공기 중에 세균이 너무 많아요!\n어떤 물건을 사용하면 좋을까요?")
                            .font(.custom("MaplestoryOTFLight", size: 20))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding([.vertical], 40)
                    }
                    
                    if(self.isThermometerSelected || self.isBandageSelected || self.isHandSanitizerSelected){
                        
                        Text("다시 시도해보세요.")
                            .font(.custom("MaplestoryOTFLight", size: 20))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding([.vertical], 40)
                    }
                    
                    if(self.isMaskSelected == true){
                        
                        Text("마스크를 올바른 위치에 착용해보세요!")
                        .font(.custom("MaplestoryOTFLight", size: 20))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding([.vertical], 40)
                        
                    }
                    
                    if(!self.isMaskSelected == true){
                        HStack{
                            Button(action: {
                                self.isThermometerSelected = true
                                self.isBandageSelected = false
                                self.isHandSanitizerSelected = false
                                self.isMaskSelected = false
                                playSound(sound: "retry", type: "mp3")
                            }) {
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.white)
                                        .frame(width : 40, height : 40)
                                        .opacity(0.5)
                                        .overlay(Circle()
                                            .stroke(Color.background,lineWidth : 1.5))
                                    
                                    Image("Thermometer")
                                        .resizable()
                                        .frame(width: 30, height: 20)
                                        .rotationEffect(Angle(degrees: -45))
                                }.padding([.horizontal], 10)
                            }
                            
                            Button(action: {
                                self.isThermometerSelected = false
                                self.isBandageSelected = false
                                self.isHandSanitizerSelected = false
                                self.isMaskSelected = true
                                playSound(sound: "MaskTODO_2", type: "mp3")
                            }) {
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.white)
                                        .frame(width : 40, height : 40)
                                        .opacity(0.5)
                                        .overlay(Circle()
                                            .stroke(Color.background,lineWidth : 1.5))
                                    
                                    Image("Mask")
                                        .resizable()
                                        .frame(width: 30, height: 20)
                                }.padding([.horizontal], 10)
                            }
                            
                            Button(action: {
                                self.isThermometerSelected = false
                                self.isBandageSelected = true
                                self.isHandSanitizerSelected = false
                                self.isMaskSelected = false
                                playSound(sound: "retry", type: "mp3")
                            }) {
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.white)
                                        .frame(width : 40, height : 40)
                                        .opacity(0.5)
                                        .overlay(Circle()
                                            .stroke(Color.background,lineWidth : 1.5))
                                    
                                    Image("Bandage")
                                        .resizable()
                                        .frame(width: 30, height: 20)
                                }.padding([.horizontal], 10)
                            }
                            
                            Button(action: {
                                self.isThermometerSelected = false
                                self.isBandageSelected = false
                                self.isHandSanitizerSelected = true
                                self.isMaskSelected = false
                                playSound(sound: "retry", type: "mp3")
                            }) {
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.white)
                                        .frame(width : 40, height : 40)
                                        .opacity(0.5)
                                        .overlay(Circle()
                                            .stroke(Color.background,lineWidth : 1.5))
                                    
                                    Image("HandSanitizer_large")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }.padding([.horizontal], 10)
                            }
                        }.onAppear(perform: {
                            playSound(sound: "maskTODO_1", type: "mp3")
                        })
                    }
                    
                }
            }
        }
    }
}

class ARHostingController: UIHostingController<MaskTODO_1>{
    required init?(coder: NSCoder){
        super.init(coder: coder, rootView: MaskTODO_1())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct MaskTODO_1_Previews: PreviewProvider {
    static var previews: some View {
        MaskTODO_1()
    }
}
