//
//  MaskTODO_NoseDetect.swift
//  MEDi
//
//  Created by 하창진 on 2020/08/01.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI
import UIKit

var text : String = "코부분을 꾹꾹 눌러서\n세균이 들어가지 않게 막아주세요!"

struct MaskTODO_NoseDetect: View {
    @State public var screenSize : Int = Int(UIScreen.main.bounds.width * UIScreen.main.bounds.height)
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color.white)
                    .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 6)
                    .opacity(0.8)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.background, lineWidth : 2))
                
                VStack{
                    Text(text)
                        .font(.custom("MaplestoryOTFLight", size: 20))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding([.vertical], 40)
                }
            }
        }.onAppear(perform: {
            playSound(sound: "MaskTODO_3", type: "mp3")
        })
    }
}

class ARHostingController_Nose: UIHostingController<MaskTODO_NoseDetect>{
    required init?(coder: NSCoder){
        super.init(coder: coder, rootView: MaskTODO_NoseDetect())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct MaskTODO_NoseDetect_Previews: PreviewProvider {
    static var previews: some View {
        MaskTODO_NoseDetect()
    }
}
