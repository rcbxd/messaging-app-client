//
//  Settings.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI
import NavigationStack

struct getUserResponse: Codable{
    var success: Bool
    var message: String
    var user: User
}

struct Settings: View {
    
    @State private var responseMessage: String?
    @State private var responseSuccess: Bool?
    @State private var user: User?
    
    @State private var token = "";
    
    @State private var isError = false;
    
    @State private var isLoggedOut = false
    
    var body: some View {
        VStack{
            Text("Settings!")
            Text("Email: \(user?.email ?? "")")
            Text(self.responseMessage ?? "")
            Button(action: {
                UserDefaults.standard.set(nil, forKey: "authToken")
                UserDefaults.standard.synchronize()
                self.isLoggedOut = true;
            }){
                Text("Logout")
            }
            PushView(destination: SignIn(), isActive: self.$isLoggedOut) {
                EmptyView()
            }
        }.onAppear{
            if let token = UserDefaults.standard.string(forKey: "authToken") {
                print("You are already logged in. Your token: \(token)") // Some String Value
                //validate the token
                self.token = token;
                self.getUser(token: token)
            }
            else{
                self.isError = true;
                print("no token found!")
                self.responseMessage = "You are not logged in"
            }
        }
    }
    
    func getUser(token: String){
        guard let url =
            URL(string: "http://localhost:5000/api/auth/get-user-by-token?token=\(token)")
            else {
                fatalError("URL is not correct/valid!")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            print("Status Code: \(httpResponse.statusCode)") // this will shown the status code so you can easily get which type of error code is generate
            
            if(httpResponse.statusCode == 200)
            {
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(getUserResponse.self, from: data) {
                        
                        print(data)
                        // we have good data – go back to the main thread
                        DispatchQueue.main.async {
                            // update our UI
                            self.responseMessage = decodedResponse.message
                            self.responseSuccess = decodedResponse.success
                            self.user = decodedResponse.user
                            
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
                self.responseMessage = "Invalid Token"
                self.responseSuccess = false
                self.isError = true
                print("invalid token!")
            }
            
        }.resume()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
