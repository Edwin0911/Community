//
//  PostList.swift
//  Community
//
//  Created by 龔照博 on 2021/5/30.
//

import SwiftUI

struct PostList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLanmarks: [Landmark] {
        modelData
            .landmarks.filter { landmark in
                !showFavoritesOnly  || landmark.isFavorite
                
            }
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                /*
                Toggle(isOn: $showFavoritesOnly, label: { //加開關
                    Text("Favorites only")
                })
                */
                ForEach(filteredLanmarks) { landmark in
                    NavigationLink(destination: PostDetail(landmark: landmark)) { //使列表可以點進頁面
                        PostRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Posts") //List的標題
//            .offset(y:-10)
            
        }
        .navigationBarHidden(true)
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
            .environmentObject(ModelData())
    }
}
