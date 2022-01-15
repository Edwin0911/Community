//
//  ReposStore.swift
//  GitHubRepoViewer
//
//  Created by 龔照博 on 2021/5/24.
//

import Foundation
import Combine

//ObservableObject, Publish
final class ReposStore: ObservableObject {
    @Published private(set) var repos: [Repo] = []
    
    private let service: GitHubService
    
    init(service: GitHubService) {
        self.service = service
    }
    
    func fetch(matching query: String) {
        service.search(matching: query) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let repos): self.repos = repos
                case .failure: self.repos = []
                }
            }
        }
    }
}
