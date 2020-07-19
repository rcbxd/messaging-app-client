//
//  Home.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var query = "";
    
    var body: some View {
        VStack(){
            VStack(spacing: 22){
                TopView(text: "Messages").zIndex(25);
                FavoriteContacts();
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.black.opacity(0.3))
                    
                    TextField("Search", text: self.$query)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .padding(.bottom, 10)
                
            }.padding().background(Color("Color-1")).clipShape(TopShape())
            Spacer();
            List(data){i in
                cellView(data: i)
            }
            .padding(.top, 20)
            .background(Color.white)
            .clipShape(TopShape())
            .offset(y: -25)
        }
    }
}

struct cellView : View {
    var data : ChatPreview
    
    var body : some View{
        HStack(spacing: 12){
            LoadableImageView(with: data.profilePictureURL).frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12){
                Text(data.name).fontWeight(.bold)
                HStack{
                    if(data.fromYou){
                        
                        Text("You:").font(.caption).fontWeight(.semibold)
                    }
                    Text(data.message).font(.caption)
                }
            }
            
            Spacer(minLength: 0)
            
            VStack{
                HStack{
                    if(data.fromYou){
                        if(data.isRead){
                            Image(systemName: "checkmark.seal").foregroundColor(Color("Color"))
                        }
                        else{
                            Image(systemName: "checkmark").foregroundColor(Color("Color"))
                        }
                    }
                    Text(data.date)
                }
                
                Spacer()
            }
            
        }.padding(.vertical)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
