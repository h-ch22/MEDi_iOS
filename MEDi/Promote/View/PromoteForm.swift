//
//  PromoteForm.swift
//  MEDi
//
//  Created by 하창진 on 2020/07/18.
//  Copyright © 2020 MEDi. All rights reserved.
//

import SwiftUI

enum Sheet{
    case person, family, defaults
}

struct PromoteForm: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var showModalSelect = false
    @State private var Sheet: Sheet = .defaults
    @State private var isPersonSelected: Bool = false
    @State private var isFamilySelected: Bool = false
    @State private var showingAlert = false
    @Binding var showModalForm : Bool

    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                Text("구매할 키트의 종류를\n선택하세요.")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    self.isPersonSelected = true
                    self.isFamilySelected = false
                }) {
                    VStack {
                        HStack{
                            Text("키트").font(.title).bold().foregroundColor(isPersonSelected ? Color.white : Color.borderGR_start)
                            Spacer()
                            
                            if(isPersonSelected == true){
                                Image(systemName: "checkmark").foregroundColor(Color.white)
                            }
                        }
                        
                        HStack{
                            Text("8,000원").foregroundColor(isPersonSelected ? Color.white : Color.borderGR_start)
                            Spacer()
                        }
                        
                        HStack {
                            Text("배송료 포함").foregroundColor(isPersonSelected ? Color.white : Color.borderGR_start)
                            Spacer()
                        }

                    }
                }.frame(minWidth: 0, maxWidth : 250)
                    .padding(15)
                    .background(isPersonSelected ? LinearGradient(gradient: Gradient(colors: [Color.buttonGR_start, Color.buttonGR_end]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius : 15).stroke(isPersonSelected ? Color.clear : Color.borderGR_start, lineWidth: 2))
                
                Spacer().frame(height : 20)
                
                Button(action: {
                    self.isPersonSelected = false
                    self.isFamilySelected = true
                }) {
                    VStack {
                        HStack{
                            Text("구급상자 + 키트").font(.title).bold().foregroundColor(isFamilySelected ? Color.white : Color.borderGR_start)
                            
                            Spacer()
                            
                            if(isFamilySelected == true){
                                Image(systemName: "checkmark").foregroundColor(Color.white)
                            }
                        }
                        
                        HStack{
                            Text("15,000원").foregroundColor(isFamilySelected ? Color.white : Color.borderGR_start)
                            Spacer()
                        }
                        
                        HStack {
                            Text("배송료 포함").foregroundColor(isFamilySelected ? Color.white : Color.borderGR_start)
                            Spacer()
                        }
                    }
                }.frame(minWidth: 0, maxWidth : 250)
                    .padding(15)
                    .background(isFamilySelected ? LinearGradient(gradient: Gradient(colors: [Color.buttonGR_start, Color.buttonGR_end]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color.clear, Color.clear]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(15)
                    .overlay(RoundedRectangle(cornerRadius : 15).stroke(isFamilySelected ? Color.clear : Color.borderGR_start, lineWidth: 2))
                
                Spacer()
                
                Button(action: {
                    if(self.isPersonSelected){
                        self.showingAlert = false
                        self.Sheet = .person
                        self.showModalSelect = true
                    }
                    
                    if(self.isFamilySelected){
                        self.showingAlert = false
                        self.Sheet = .family
                        self.showModalSelect = true
                    }
                    
                    if(!self.isFamilySelected && !self.isPersonSelected){
                        self.showingAlert = true
                    }
                }) {
                    HStack {
                        Text("구매 신청하기").foregroundColor(Color.white)
                        Image(systemName: "arrow.right").foregroundColor(Color.white)
                    }
                    
                }.frame(minWidth: 0, maxWidth: 250)
                    .padding(15)
                    .background(Color.borderGR_start)
                    .cornerRadius(10)
                    .sheet(isPresented: $showModalSelect){
                        if self.Sheet == .person{
                            Buy_Person(showModalSelect: self.$showModalSelect).navigationViewStyle(StackNavigationViewStyle())
                        }
                        
                        if self.Sheet == .family{
                            Buy_Family(showModalSelect: self.$showModalSelect).navigationViewStyle(StackNavigationViewStyle())
                        }
                }
                
                Spacer()
                
            }
            .alert(isPresented : $showingAlert){
                Alert(title: Text("정보"), message: Text("구매할 키트의 종류를 선택해주십시오."), dismissButton: .default(Text("확인")))
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarTitle(Text("추가기능 구입하기"), displayMode: .inline)
            .navigationBarItems(leading: Button("취소"){
                self.showModalForm = false
            })
        }
    }
}

struct PromoteForm_Previews: PreviewProvider {
    static var previews: some View {
        PromoteForm(showModalForm: .constant(true))
    }
}
