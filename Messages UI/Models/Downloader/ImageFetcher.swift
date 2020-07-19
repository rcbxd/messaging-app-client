//
//  ImageFetcher.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageFetcher: ObservableObject{
    @Published var downloadData: Data? = nil
    
    func downloadImage(url: String){
        guard let imageUrl = URL(string: url) else {
            self.downloadData = nil
            return;
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
}

