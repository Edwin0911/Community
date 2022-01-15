//
//  SearchView.swift
//  GitHubRepoViewer
//
//  Created by 龔照博 on 2021/5/24.
//

import SwiftUI

struct SearchView: View {
    @State var query: String = ""
    @EnvironmentObject var reposStore: ReposStore
    
    private func fetch() {
        reposStore.fetch(matching: query)
    }
    
    var body: some View {
        NavigationView {

            List {
                TextField("Search for post",
                          text: $query,
                          onCommit: fetch)
                ForEach(reposStore.repos) { repo in
                    RepoRow(repo: repo)
                }
            }
            .navigationTitle("Search")

        }
        .onAppear(perform: fetch)
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ReposStore(service: .init()))
    }
}
