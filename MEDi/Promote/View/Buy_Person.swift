//
//  Buy_Person.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/20.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import FirebaseCore
import FirebaseFirestore
import RxKakaoSDKCommon
import KakaoSDKCommon
import FirebaseAuth

private var uploadResult : String = ""

enum buyAlert{
    case success, noCode, used, blank, failed
}

struct Buy_Person: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var showModalSelect : Bool
    @State private var showModalSuccess : Bool = false
    @State var name : String = ""
    @State var phone : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var promote : String = ""
    @State var isKakaoPay : Bool = false
    @State var isCash : Bool = false
    @State var address : String = ""
    @State public var price : Int = 8000
    @State var loadImagePicker : Bool = false
    @State var image: UIImage?
    @State public var showingAlert = false
    @State public var buyAlert : buyAlert? = nil
    @State var doll : String = ""
    @State var registerResult : Bool = false
    @State var discount: Int = 0
    @State var result: String = ""
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Group{
                        Text("1. 사용자 인적사항 입력")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding([.vertical], 20)
                        
                        TextField("성명", text: $name)
                            .padding(.leading)
                            .padding([.vertical], 20)
                        
                        TextField("전화번호", text: $phone)
                            .textContentType(.oneTimeCode)
                            .keyboardType(.numberPad)
                            .padding(.leading)
                            .padding([.vertical], 20)
                        
                        HStack{
                            TextField("주소", text : $address)
                                .padding(.leading)
                                .padding([.vertical], 20)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("주소찾기")
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }.padding(.trailing)
                            
                        }
                        
                        TextField("E-Mail", text: $email)
                            .keyboardType(.emailAddress)
                            .padding(.leading)
                            .padding([.vertical], 20)
                        
                        SecureField("결제 정보 확인용 비밀번호", text: $password)
                            .padding(.leading)
                            .padding([.vertical], 20)
                        
                        Text("2. 피규어 정보 입력")
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        TextField("피규어 이름", text: $doll)
                            .padding(.leading)
                            .padding([.vertical], 20)
                        
                        if image != nil{
                            Image(uiImage: image!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        Button(action: {
                            self.loadImagePicker.toggle()
                        }) {
                            HStack {
                                Text("피규어 사진 불러오기")
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                
                                Image(systemName : "camera.on.rectangle.fill")
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }
                        }.padding([.vertical], 20)
                            .sheet(isPresented: $loadImagePicker){
                                ImagePickerView(sourceType: .photoLibrary){
                                    image in self.image = image
                                }
                        }
                    }

                    Group{
                        Text("3. 결제 금액 확인 및\n프로모션 코드 입력")
                            .font(.title)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        HStack {
                            TextField("프로모션 코드 입력", text: $promote)
                                .padding(.leading)
                                .keyboardType(.numberPad)
                                .padding([.vertical], 20)
                            
                            Button(action: {
                                if(self.promote != ""){
                                    checkCode().checkCode(code: self.promote)

                                    if(checkCodeVariable.result == "success"){
                                        self.price = self.price - checkCodeVariable.discount
                                        
                                        if(self.price < 0){
                                            self.price = 0
                                        }
                                    }
                                    
                                    if(checkCodeVariable.result == "noCode"){
                                        self.buyAlert = .noCode
                                    }
                                    
                                    if(checkCodeVariable.result == "used"){
                                        self.buyAlert = .used
                                    }
                                }
                                
                                else{
                                    self.showingAlert = true
                                    self.buyAlert = .blank
                                }
                            }) {
                                Text("확인")
                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            }.padding(.trailing)
                            
                        }
                    }
                    
                    
                    Text("할인 : \(String(checkCodeVariable.discount))원")
                    
                    Text("최종 결제 금액 : \(String(price))원")
                        .font(.title)
                        .padding([.vertical], 20)
                    
                    Group{
                        Text("4. 결제 방식 선택")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        HStack{
                            Button(action: {
                                self.isCash = false
                                self.isKakaoPay = true
                            }) {
                                VStack{
                                    HStack {
                                        if(self.isKakaoPay == true){
                                            Image(systemName: "checkmark")
                                                .foregroundColor(Color.borderGR_start)
                                        }
                                        
                                        Image("kakaopay")
                                            .resizable()
                                            .frame(width : 150, height : 60)
                                    }
                                    
                                    Text("카카오페이")
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                            }.frame(minWidth: 0, maxWidth: 150)
                                .padding(15)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(self.isKakaoPay == true ? Color.borderGR_start : Color.gray, lineWidth: 2))
                            
                            Button(action: {
                                self.isCash = true
                                self.isKakaoPay = false
                            }) {
                                VStack{
                                    HStack {
                                        if(self.isCash == true){
                                            Image(systemName: "checkmark")
                                                .foregroundColor(Color.borderGR_start)
                                        }
                                        
                                        Image(systemName : "wonsign.circle.fill")
                                            .resizable()
                                            .frame(width : 60, height : 60)
                                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                    }
                                    
                                    Text("계좌이체")
                                        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                }
                            }.frame(minWidth: 0, maxWidth: 150)
                                .padding(15)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(self.isCash == true ? Color.borderGR_start : Color.gray, lineWidth: 2))
                        }
                    }
                    
                    Button(action: {
                        self.registerResult = UserRegister()
                            .register(email: self.email, password: self.password, name: self.name)
                        
                        let date: Date = Date()
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
                        let dateString = dateFormatter.string(from: date)
                        
                        saveUserData().sendUserData(name: self.name, phone: self.phone, dollName: self.doll, date: dateString, email: self.email, address: self.address, isSet: false)
                        
                        saveUserData().uploadImage(name: self.name, date: dateString, withImage : self.image!)
                        
                        if(self.registerResult == true){
                            self.showModalSuccess = true
                        }
                        
                        else{
                            self.buyAlert = .failed
                            self.showingAlert = true
                        }
                    }) {
                        HStack {
                            Text("결제하기").foregroundColor(Color.white)
                            Image(systemName: "arrow.right").foregroundColor(Color.white)
                        }
                    }.frame(minWidth: 0, maxWidth: 250)
                        .padding(15)
                        .background(Color.borderGR_start)
                        .cornerRadius(10)
                        .sheet(isPresented: $showModalSuccess){
                            Buy_Success(showModalSuccess: self.$showModalSuccess).navigationViewStyle(StackNavigationViewStyle())
                    }
                    
                }.padding(.bottom, keyboard.currentHeight)
                    .navigationBarTitle(Text("키트 구입하기"), displayMode: .inline)
                    .navigationBarItems(leading: Button("취소"){
                        self.showModalSelect = false
                    })
                
            }.alert(isPresented : $showingAlert){
                switch buyAlert{
                    
                case .blank: return Alert(title: Text("프로모션 코드 입력"), message: Text("프로모션 코드를 입력하십시오."), dismissButton:.default((Text("확인"))))
                    
                case .success: return Alert(title: Text("프로모션 코드 적용 완료"), message: Text("프로모션 코드가 정상적으로 적용되었습니다."), dismissButton:.default((Text("확인"))))
                    
                case .noCode: return Alert(title: Text("존재하지 않는 코드"), message: Text("프로모션 코드가 존재하지 않거나 네트워크 상태가 불안정합니다."), dismissButton:.default((Text("확인"))))
                    
                case .used: return Alert(title: Text("이미 사용한 코드"), message: Text("이미 사용한 프로모션 코드입니다."), dismissButton:.default((Text("확인"))))
                    
                case .failed: return Alert(title: Text("결제 실패"), message: Text("주문 내용을 처리하는 중 오류가 발생하였습니다.\n네트워크 상태를 확인한 후 관리자에게 문의하십시오."), dismissButton:.default((Text("확인"))))
                    
                case .none:
                    return Alert(title: Text(""), message: Text(""), dismissButton: .default((Text(""))))
                }
            }
        }
    }
}

struct Buy_Person_Previews: PreviewProvider {
    static var previews: some View {
        Buy_Person(showModalSelect: .constant(true))
    }
}
