//
//  Feedback.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/22.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

private var result : Bool = false

private func FeedbackSend(division: String, Feedback: String) -> Void{
    var db: Firestore!
    let settings = FirestoreSettings()
    
    Firestore.firestore().settings = settings
    
    db = Firestore.firestore()
    
    var ref: DocumentReference? = nil
    
    ref = db.collection("Feedback").addDocument(data: [
        "division" : division,
        "Feedback" : Feedback
    ]){
        err in
        
        if let err = err{
            print("Firestore Data upload Error: \(err)")
            
            result = false
        }
            
        else{
            print("Firestore Data upload Successful.")
            
            result = true
        }
    }
}

enum activeAlert{
    case success, fail, noContents, noDivision
}

struct Feedback: View {
    @Binding var showFeedbackModal : Bool
    @State private var isGoodSelected : Bool = false
    @State private var isBadSelected : Bool = false
    @State private var showingAlert = false
    @State private var activeAlert : activeAlert = .noContents
    @State private var Feedback : String = ""
    @State private var division : String = ""
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        NavigationView{
            VStack{
                Image("BG_heart").resizable().frame(width: 200, height: 200)
                Text("여러분의 의견을 들려주세요.")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                HStack{
                    Button(action: {
                        self.isBadSelected = false
                        self.isGoodSelected = true
                        self.division = "Good"
                    }) {
                        if(isGoodSelected == true){
                            VStack{
                                Image("heart").resizable().frame(width: 50, height: 50).foregroundColor(Color.red)
                                Text("칭찬해요").foregroundColor(Color.red)
                            }
                        }
                            
                        else{
                            VStack{
                                Image("heart").resizable().frame(width: 50, height: 50).foregroundColor(Color.gray)
                                Text("칭찬해요").foregroundColor(Color.gray)
                            }
                        }
                    }.frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                        .padding(15)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius : 15).stroke(Color.gray, lineWidth: 2))
                    
                    Button(action: {
                        self.isBadSelected = true
                        self.isGoodSelected = false
                        self.division = "Bad"
                    }) {
                        if(isBadSelected == true){
                            VStack{
                                Image("bad").resizable().frame(width: 50, height: 50).foregroundColor(Color.blue)
                                Text("개선해주세요").foregroundColor(Color.blue)
                            }
                        }
                            
                        else{
                            VStack{
                                Image("bad").resizable().frame(width: 50, height: 50).foregroundColor(Color.gray)
                                Text("개선해주세요").foregroundColor(Color.gray)
                            }
                        }
                    }.frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100)
                        .padding(15)
                        .background(Color.clear)
                        .overlay(RoundedRectangle(cornerRadius : 15).stroke(Color.gray, lineWidth: 2))
                }
                
                Spacer()
                
                TextField("여러분의 의견을 입력해주세요.", text: $Feedback)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                
            }.navigationBarTitle(Text("피드백 보내기"), displayMode: .inline)
                .navigationBarItems(leading: Button("취소"){
                    self.showFeedbackModal = false
                    }, trailing: Button("전송"){
                        if(self.Feedback == ""){
                            self.activeAlert = .noContents
                        }
                            
                        if(self.division == ""){
                            self.activeAlert = .noDivision
                        }
                            
                        if(self.Feedback == "" && self.division == ""){
                            self.activeAlert = .noContents
                        }
                            
                        else{
                            FeedbackSend(division: self.division, Feedback : self.Feedback)
                            
                            if(result == true){
                                self.activeAlert = .success
                            }
                            
                            if(result == false){
                                self.activeAlert = .fail
                            }
                        }
                        
                        self.showingAlert = true
                })
                .padding()
                .padding(.bottom, keyboard.currentHeight)
                .animation(.easeOut(duration: 0.16))
                .edgesIgnoringSafeArea(.bottom)
            
        }.alert(isPresented : $showingAlert){
            switch activeAlert{
            case .success: return Alert(title: Text("피드백을 전송해주셔서 감사합니다."), message: Text("피드백이 정상적으로 전송되었습니다.\n소중한 피드백은 애플리케이션을 개선하는데 최대한 활용하도록 노력하겠습니다."), dismissButton: .default(Text("확인")))
                
            case .fail : return Alert(title: Text("피드백 전송 실패"), message: Text("피드백을 전송하지 못했습니다\n네트워크 상태를 확인하고 다시시도하거나 나중에 다시시도하십시오."), dismissButton: .default(Text("확인")))
                
            case .noContents : return Alert(title: Text("피드백 내용 입력"), message: Text("피드백 내용을 입력하여 주십시오."), dismissButton: .default(Text("확인")))
                
            case .noDivision : return Alert(title: Text("피드백 종류 선택"), message: Text("피드백의 종류를 선택하여 주십시오."), dismissButton: .default(Text("확인")))
            }
        }
        
    }
}

struct Feedback_Previews: PreviewProvider {
    static var previews: some View {
        Feedback(showFeedbackModal: .constant(true))
    }
}
