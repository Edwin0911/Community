//
//  HikeBadge.swift
//  Landmarks
//
//  Created by cycu on 2021/5/3.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 60))
                .frame(width: 100, height: 100)
            
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).") //accessibilityLabel:無障礙設計,叫siri為視障者唸出名稱
        }
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Texting")
    }
}
