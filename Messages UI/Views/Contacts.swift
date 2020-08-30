//
//  Contacts.swift
//  Messages UI
//
//  Created by Anthony on 7/24/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct contactsResponse: Codable {
    var success: Bool
    var message: String
    var people: [User]
}

struct Contacts: View {
    
    @State private var query = "";
    @State var people:[User] = []
    
    @State private var responseMessage: String?
    @State private var responseSuccess: Bool?
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.query
        }, set: {
            self.query = $0
            if(self.query.count > 3){
                let q = self.query.replacingOccurrences(of: " ", with: "%20")
                self.fetchUsers(query: q);
            }
        })
        return VStack(){
            VStack(spacing: 22){
                TopView(text: "Contacts").zIndex(25);
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.black.opacity(0.3))
                    
                    TextField("Search", text: binding)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.bottom, 10)
                
            }.padding().background(Color("Color-1")).clipShape(TopShape())
            Spacer();
            List(self.people){i in
                ContactRow(data: i)
            }
            .padding(.top, 20)
            .background(Color.white)
            .clipShape(TopShape())
            .offset(y: -25)
        }
    }
    
    func fetchUsers(query: String){
        guard let url =
            URL(string: "http://localhost:5000/api/contacts/find-contacts?searchQuery=\(query)")
            else {
                fatalError("URL is not correct/valid!")
            }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let httpResponse = response as! HTTPURLResponse
            print("Status Code: \(httpResponse.statusCode)") // this will shown the status code so you can easily get which type of error code is generate
            
            if(httpResponse.statusCode == 200)
            {
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode(contactsResponse.self, from: data) {
                        
                        print(data)
                        // we have good data – go back to the main thread
                        DispatchQueue.main.async {
                            // update our UI
                            self.responseMessage = decodedResponse.message
                            self.responseSuccess = decodedResponse.success
                            self.people = decodedResponse.people
                            
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

                print("invalid token!")
            }
            
        }.resume()
    }
}

struct ContactRow: View{
    
    var data : User
    
    var body : some View{
        HStack(spacing: 12){
            LoadableImageView(with: data.profilePictureURL).frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12){
                Text(data.name).fontWeight(.bold)
                Text("@\(data.username)").fontWeight(.light)
            }
            
            Spacer(minLength: 0)
            
            Image(systemName: "message.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color.black.opacity(0.6));
            
        }.padding(.vertical)
    }
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}
