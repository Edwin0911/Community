//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by cycu on 2021/4/12.
//

import SwiftUI

struct FavoriteButton: View {
    //綁定
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()  //true,false可直接互換
        }, label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? Color.pink : Color.gray)
                
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true)) //Binding of Bool
    }
}
