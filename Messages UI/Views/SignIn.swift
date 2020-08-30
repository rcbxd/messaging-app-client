//
//  SignIn.swift
//  Messages UI
//
//  Created by Anthony on 7/20/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI
import NavigationStack

struct signInResponse: Codable{
    var success: Bool
    var message: String
    var token: String
}

struct SignIn: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var responseMessage: String?
    @State private var responseSuccess: Bool?
    @State private var responseToken: String?
    
    @State private var isError = false;
    
    @State private var isLoggedIn = false;
    
    var alert: Alert {
        Alert(title: Text("Error!"), message: Text(self.responseMessage ?? ""), dismissButton: .default(Text("Try again")))
    }
    
    var body: some View {
        VStack(){
            Text("Sign In").font(.largeTitle).fontWeight(.bold).padding(.bottom,5)
            TextField("Email or Username", text: $email)
                .padding()
                .background(Color("Color-1"))
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            SecureField("Password", text: $password)
                .padding()
                .background(Color("Color-1"))
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            HStack(alignment: .center){
                Button(action: {
                    self.signIn(email: self.email, password: self.password)
                }){
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
                .alert(isPresented: self.$isError, content: { self.alert })
            PushView(destination: TabView(), isActive: self.$isLoggedIn) {
                EmptyView()
            }
        }.padding(.horizontal, 20)
    }
    
    func signIn(email: String, password: String){
        guard let url =
            URL(string: "http://localhost:5000/api/auth/signin")
            else {
                fatalError("URL is not correct/valid!")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "email": email,
            "password": password
        ]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            print("Status Code: \(httpResponse.statusCode)") // this will shown the status code so you can easily get which type of error code is generate
            
            if(httpResponse.statusCode == 200)
            {
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(signInResponse.self, from: data) {
                        
                        print(data)
                        // we have good data – go back to the main thread
                        DispatchQueue.main.async {
                            // update our UI
                            self.responseMessage = decodedResponse.message
                            self.responseSuccess = decodedResponse.success
                            self.responseToken = decodedResponse.token
                            
                            UserDefaults.standard.set(self.responseToken, forKey: "authToken")
                            UserDefaults.standard.synchronize()
                            
                            self.isLoggedIn = true
                        }
                        
                        // everything is good, so we can exit
                        return
                    }
                }
                
                // if we're still here it means there was a problem
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
            else
            {
                self.responseMessage = "Incorrect Credentials"
                self.responseSuccess = false
                self.isError = true
            }
            
        }.resume()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
