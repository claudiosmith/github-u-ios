//
//  UserRepoBuilder.swift
//  github-u-ios
//
//  Created by Claudio Smith on 17/05/23.
//

import SwiftUI

final class UserRepoBuilder: Building {
    
    private lazy var reposData = [UserRepoViewData]()
    init() {}
    
    var repos: [UserRepo]? {
        didSet {
            setRepos()
        }
    }

    private func setRepos() {

        guard let repos = repos else { return }

        let starEmoji = "⭐️"

        let strongself = self
        repos.forEach { repo in

            let stars = "\(repo.stargazersCount.description) \(starEmoji)"

            let viewData = UserRepoViewData(stars: stars, repoUrl: repo.repoURL)
            strongself.reposData.append(viewData)
        }
    }
    
    public func build() -> [UserRepoViewData] { reposData }
}
