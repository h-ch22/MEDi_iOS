//
//  MaskTODO_Finish.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/02.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

struct MaskTODO_Finish: View {
    var body: some View {
        VStack{
            
            ZStack{
                Circle()
                    .fill(Color.white)
                    .opacity(0.8)
                    .frame(width:80, height:80)
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .foregroundColor(Color.green)
            }
            
            Text("잘했어요!")
                .font(.custom("MaplestoryOTFLight", size: 25))
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding([.vertical], 10)
            
            Spacer().frame(height: 50)
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 3)
                    .opacity(0.8)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.background, lineWidth : 2))
                
                VStack {
                    VStack{
                        Text("세균이 입이나 코로\n들어가는 것을 막아주는 마스크!")
                            .font(.custom("MaplestoryOTFLight", size: 20))
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                            .padding([.vertical], 40)
                    }
                    
                    HStack{
                        Spacer()
                        
                        VStack {
                            Image("Mask").resizable().frame(width : 90, height: 70)
                            
                            Text("마스크의 안쪽은\n만지면 안돼요!")
                                .font(.custom("MaplestoryOTFLight", size: 15))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image("kids_3").resizable().frame(width : 50, height: 90)
                            
                            Text("코 부분을 꾹꾹 눌러주세요!")
                                .font(.custom("MaplestoryOTFLight", size: 15))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image("clock").resizable().frame(width : 70, height: 70)
                            
                            Text("한개를 오랫동안\n사용하면 안돼요!")
                                .font(.custom("MaplestoryOTFLight", size: 15))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            playSound(sound: "mask_final", type: "mp3")
        })
    }
}

struct MaskTODO_Finish_Previews: PreviewProvider {
    static var previews: some View {
        MaskTODO_Finish()
    }
}
