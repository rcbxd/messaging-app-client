//
//  LoadableImageView.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct LoadableImageView: View {
    
    @ObservedObject private var downloadImage = ImageFetcher()
    
    let url: String
    
    init(with: String){
        self.url = with
        self.downloadImage.downloadImage(url: with)
    }
    
    var body: some View{
        if let imageData = self.downloadImage.downloadData {
            if(imageData == nil){
                return VStack{
                    Image(systemName: "person.circle.fill").resizable().clipShape(Circle())
                }
            }
            let img = UIImage(data: imageData)
            return VStack{
                Image(uiImage: img!).resizable().clipShape(Circle())
            }
        }
        else{
            return VStack{
                Image(systemName: "person.circle.fill").resizable().clipShape(Circle())
            }
        }
    }
    
}

struct LoadableImageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadableImageView(with: "https://avatars2.githubusercontent.com/u/50280805?s=400&u=77fc9891af8f385471ad0ffef8080f2e6a20550f&v=4")
    }
}
