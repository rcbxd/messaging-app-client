//
//  SignUp.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @State private var isFormValid = false;
    @State private var userPasswordRepeated = "";
    @State private var userPassword = "";
    @State private var userEmail = "";
    var body: some View {
        VStack(){
            Text("Sign Up").font(.largeTitle).fontWeight(.bold).padding(.bottom,5)
            TextField("Email", text: $userEmail)
                .padding()
                .background(Color("Color-1"))
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            SecureField("Password", text: $userPassword)
                .padding()
                .background(Color("Color-1"))
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            SecureField("Repeat Password", text: $userPasswordRepeated)
                .padding()
                .background(Color("Color-1"))
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            HStack(alignment: .center){
                Button(action: {self.isFormValid = true}){
                    Spacer()
                    Text("Next")
                        .foregroundColor(Color("Color-1"))
                    Spacer()
                }
                .background(Color("Color-2"))
                .padding(.vertical, 7.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Color-2"), lineWidth: 15)
                )
            }.padding(.top, -5).padding()
            
        }.padding(.horizontal, 20)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
