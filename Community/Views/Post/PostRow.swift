//
//  PostRow.swift
//  Community
//
//  Created by 龔照博 on 2021/5/30.
//

import SwiftUI

struct PostRow: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        VStack(alignment:.center) { //垂直排序
            HStack {
                Text(landmark.name)
                    .font(.title)
                
                Spacer()
                
                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
            }
            
            landmark.image
                .resizable() //填滿邊匡
                .scaledToFit()
               
            
            HStack { //橫向排序
                Text(landmark.park)
                
                Spacer() //中間空行
                
                Text(landmark.state)
            }
            .font(.subheadline) //讓字縮小
            
        }
    }
}

struct PostRow_Previews: PreviewProvider {
    static var modelData = ModelData()

    static var previews: some View {
        
        Group {
            PostRow(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
            PostRow(landmark: modelData.landmarks[1])
                .environmentObject(modelData)

        }
        .previewLayout(.fixed(width: 300, height: 400))//小預覽
        
    }
}
