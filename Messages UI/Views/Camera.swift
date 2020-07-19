//
//  Camera.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct Camera: View {
    var body: some View {
        VStack{
            VStack(spacing: 22){
                Spacer()
            }.padding().background(Color("Color-1")).clipShape(TopShape())
        }.padding(.top, 20)
            .background(Color.white)
            .clipShape(TopShape())
        .offset(y: -25)
    }
}

struct Camera_Previews: PreviewProvider {
    static var previews: some View {
        Camera()
    }
}
