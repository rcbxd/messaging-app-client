//
//  WelcomeScreen.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI
import NavigationStack

struct WelcomeScreen: View {
    
    @State private var isSignUp = false;
    @State private var isSignIn = false;
    @State private var isLoggedIn = false;
    
    var body: some View {
        VStack(){
            Text("Welcome!").font(.largeTitle).fontWeight(.bold).padding(.bottom,20)
            HStack(alignment: .center){
                Button(action: {self.isSignIn = true}){
                    Spacer()
                    Text("Sign In")
                        .foregroundColor(.black)
                    Spacer()
                }
                .background(Color("Color-1"))
                .padding(.vertical, 7.5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("Color-1"), lineWidth: 15)
                )
            }.padding(.top, -5).padding()
            HStack(alignment: .center){
                Button(action: {self.isSignUp = true}){
                    Spacer()
                    Text("Sign Up")
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
            PushView(destination: SignIn(), isActive: self.$isSignIn) {
                EmptyView()
            }
            PushView(destination: SignUp(), isActive: self.$isSignUp) {
                EmptyView()
            }
        }.padding(.horizontal, 20)
            .onAppear{
                if let token = UserDefaults.standard.string(forKey: "authToken") {
                    print("You are already logged in. Your token: \(token)") // Some String Value
                    //validate the token
                    self.isLoggedIn = true;
                }
                else{
                    print("You are not logged in")
                }
        }
    }
}


struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
