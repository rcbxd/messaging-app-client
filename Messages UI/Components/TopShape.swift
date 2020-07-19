//
//  TopShape.swift
//  Messages UI
//
//  Created by Anthony on 7/18/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import SwiftUI

struct TopShape: Shape {
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 28, height: 28))
        
        return Path(path.cgPath);
    }
}

struct TopShape_Previews: PreviewProvider {
    static var previews: some View {
        TopShape()
    }
}
