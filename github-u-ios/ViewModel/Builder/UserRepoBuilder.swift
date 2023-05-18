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
            let viewData = UserRepoViewData(starSymbol: starEmoji,
                                            repoUrl: repo.repoURL,
                                            stars: repo.stargazersCount)
            strongself.reposData.append(viewData)
        }
        
        reposData = reposData.sorted(by: { $0.stars > $1.stars })
    }
    
    public func build() -> [UserRepoViewData] { reposData }
}
