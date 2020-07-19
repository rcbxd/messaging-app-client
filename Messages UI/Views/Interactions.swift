//
//  Interactions.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct Interactions: View {
    var body: some View {
        VStack{
            VStack(spacing: 22){
                VStack(spacing: 22){
                    TopView(text: "Interactions").zIndex(25);
                    Spacer()
                }.padding().background(Color("Color-1")).clipShape(TopShape())
            }.padding(.top, 20)
                .background(Color.white)
                .clipShape(TopShape())
                .offset(y: -25)
        }
    }
}
struct Interactions_Previews: PreviewProvider {
    static var previews: some View {
        Interactions()
    }
}
