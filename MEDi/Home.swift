//
//  Home.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/10.
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

struct Home: View {
    var body: some View {
        NavigationView{
            ZStack(alignment:.top){
                Color.main.edgesIgnoringSafeArea(.vertical)
                
                RoundedCorners(tl:0, tr:0, bl:30, br:30)
                    .fill(Color.violet)
                    .frame(width : UIScreen.main.bounds.width, height : UIScreen.main.bounds.height / 2)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    HStack {
                        Text("MEDi")
                            .font(.custom("MaplestoryOTFLight", size: 25))
                            .foregroundColor(Color.white)
                            .frame(maxWidth : UIScreen.main.bounds.width/1.5, alignment: .leading)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("cart").resizable().frame(width : 32, height : 32)
                        }
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("sun").resizable().frame(width : 32, height : 32)
                        }
                    }
                    
                    Text("오늘은 어떤 것을\n배워볼까요?")
                    .font(.custom("MaplestoryOTFLight", size: 45))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                        .frame(maxWidth: UIScreen.main.bounds.width,
                            maxHeight: UIScreen.main.bounds.height / 3,
                               alignment: .center)
                    
                    Spacer().frame(height : 125)
                    
                    HStack {
                        NavigationLink(destination: Thermometer()){
                            Text("체온계")
                            .foregroundColor(Color.main)
                            .font(Font.custom("MaplestoryOTFLight", size: 35))

                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                
                            .padding(15)
                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                        }
                        
                        NavigationLink(destination: Tutorial_Finish()){
                            Text("손소독제")
                            .foregroundColor(Color.main)
                            .font(Font.custom("MaplestoryOTFLight", size: 35))

                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                
                            .padding(15)
                            .background(RoundedCorners(tl:90, tr:0, bl:90, br:0).fill(Color.white))
                        }
                    }
                    
                    Spacer().frame(height : 45)
                    
                    HStack {
                        NavigationLink(destination: Tutorial_Finish()){
                            Text("마스크")
                            .foregroundColor(Color.main)
                            .font(Font.custom("MaplestoryOTFLight", size: 35))

                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                
                            .padding(15)
                            .background(RoundedCorners(tl:0, tr:90, bl:0, br:90).fill(Color.white))
                        }
                        
                        NavigationLink(destination: Tutorial_Finish()){
                            Text("밴드")
                            .foregroundColor(Color.main)
                            .font(Font.custom("MaplestoryOTFLight", size: 35))

                            .frame(width : UIScreen.main.bounds.width / 2, height : UIScreen.main.bounds.height/12)
                                
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
