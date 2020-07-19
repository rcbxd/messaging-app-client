//
//  TopView.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct TopView: View {
    
    @State var text: String;
    
    var body: some View {
        VStack(spacing: 18){
            HStack{
                Text(text).fontWeight(.bold).font(.title).foregroundColor(Color.black.opacity(0.7));
                Spacer();
                
                Button(action: {}){
                    Image(systemName: text == "Interactions" ? "gear" : "person.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.black.opacity(0.6));
                }
            }
        }.padding(.horizontal).padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(text: "Messages")
    }
}
