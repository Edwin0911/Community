//
//  RepoRow.swift
//  GitHubRepoViewer
//
//  Created by 龔照博 on 2021/5/24.
//

import SwiftUI

struct RepoRow: View {
    let repo: Repo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repo.name)
                .font(.headline)
            Text(repo.description)
                .font(.subheadline)
        }
    }
}

struct RepoRow_Previews: PreviewProvider {
    static var previews: some View {
        RepoRow(repo: Repo(id: 1, name: "Swift", description: "Hi!Swift"))
    }
}
