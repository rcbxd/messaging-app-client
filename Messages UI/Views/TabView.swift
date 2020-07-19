//
//  TabView.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct TabView: View {
    
    @State var index = 0
    @State var offset: CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack{
            VStack{
                Color("white")
                Color("Color")
            }
            VStack{
                GeometryReader{g in
                    HStack(spacing: 0){
                        Home().frame(width: g.frame(in: .global).width)
                        Camera().frame(width: g.frame(in: .global).width)
                        Interactions().frame(width: g.frame(in: .global).width)
                    }.offset(x: self.offset)
                    .highPriorityGesture(DragGesture()
                        .onEnded({(value) in
                            if value.translation.width > 50{
                                self.changeView(left: false)
                            };if -value.translation.width > 50{
                                self.changeView(left: true)
                            }
                        })
                    )
                }
                AppBar(index: self.$index, offset: self.$offset)
            }.animation(.default).edgesIgnoringSafeArea(.all)
        }
    }
    
    func changeView(left: Bool){
        if(left){
            if(self.index != 2){
                self.index += 1
                self.offset -= self.width
            }
            
        }
        else{
            if(self.index != 0){
                self.index -= 1
                self.offset += self.width
            }
        }
    }
    
}

struct AppBar: View {
    
    @Binding var index: Int;
    @Binding var offset: CGFloat
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        HStack(){
            Button(action: {
                self.index = 0;
                self.offset = self.width
            }){
                Image(systemName: "message.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor( self.index == 0 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            Spacer(minLength: 10)
            Button(action: {
                self.index = 1;
                self.offset = 0
            }){
                Image(systemName: "camera.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 1 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            Spacer(minLength: 10)
            Button(action: {
                self.index = 2;
                self.offset = -self.width
            }){
                Image(systemName: "cube.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 2 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
        }.padding(.horizontal, 30)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom).background(Color("Color"))
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
