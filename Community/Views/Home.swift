//
//  Cover.swift
//  Community
//
//  Created by 龔照博 on 2021/5/11.
//

import SwiftUI

struct Home: View {
    
    let store = ReposStore(service: .init())
    var modelData = ModelData()
    @State private var showingProfile = false
    @State private var selection: Tab = .user
    
    enum Tab {
        case user
        case post
        case todo
        case search
    }
    
    
    
    var body: some View {
        
//        NavigationView{
        TabView(selection: $selection) {
            
            ProfileHost()
                .environmentObject(modelData)
                .sheet(isPresented: $showingProfile, content: {
                    ProfileHost()
                })
                .tabItem {
                    Label("User",systemImage: "person")
                }
                .tag(Tab.user)
            
            PostList()
                .environmentObject(modelData)
                .tabItem {
                    Label("Posts",systemImage: "ellipsis.bubble")
                }
                .tag(Tab.post)
            
            Todo()
                .tabItem {
                    Label("Todo",systemImage: "calendar")
                }
                .tag(Tab.todo)
            
            SearchView()
                .environmentObject(store)
                .tabItem {
                    Label("Search",systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            
        }
//        .navigationBarHidden(true)
//        }
//        .navigationBarHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
