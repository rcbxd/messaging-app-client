//
//  FavoriteContacts.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct FavoriteContacts: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 18){
                Button(action: {}){
                    Image(systemName: "plus").resizable()
                        .frame(width: 25, height: 25)
                    .foregroundColor(Color("Color-2"))
                    .padding(20)
                }
                    .background(Color("Color-2")
                    .opacity(0.5))
                .clipShape(Circle())
                ForEach(1...7, id: \.self){i in
                    Button(action: {}){
                        Image("p\(i)")
                        .resizable()
                            .frame(width: 60, height: 60)
                    }
                }
            }
        }.padding(.horizontal)
    }
}

struct FavoriteContacts_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteContacts()
    }
}
