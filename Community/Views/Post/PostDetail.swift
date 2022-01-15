//
//  PostDetail.swift
//  Community
//
//  Created by 龔照博 on 2021/5/30.
//

import SwiftUI

struct PostDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
            
            
        ScrollView {
            VStack(alignment:.leading) { //垂直排序
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
                
                
                
                
                //BUTTON:收藏,聊天室
                
                
                
                
                
                Divider() //分隔線
                
//                Text("About \(landmark.name)")
//                    .font(.title2)
                
                
                Text(landmark.description)
                
            }
            .padding()//使周圍內縮

        }
    }
}

struct PostDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        
        PostDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
        
    }
}
