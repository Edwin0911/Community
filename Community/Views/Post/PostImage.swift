//
//  PostImage.swift
//  Community
//
//  Created by 龔照博 on 2021/5/30.
//

import SwiftUI

struct PostImage: View {
    
    var image: Image //設變數(小寫),型別(大寫)
    
    var body: some View {
        
        image
            .resizable() //填滿邊匡
            .scaledToFit()
    }
}

struct PostImage_Previews: PreviewProvider {
    static var previews: some View {
        PostImage(image: Image("turtlerock"))
    }
}
