//
//  UserViewData.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

struct UserViewData: Hashable {
    
    var login: String = .empty
    var htmlUrl: String = .empty
    var avatarUrl: URL = URL(fileURLWithPath: .empty)
    
}

struct UserDetailViewData: Hashable {

    var login: String = .empty
    var name: String = .empty
    var reposURL: URL = URL(fileURLWithPath: .empty)
    var location: String = .empty
    var followers: String = .empty
    var avatarUrl: URL = URL(fileURLWithPath: .empty)
        
}

struct UserRepoViewData: Hashable {
    
    var starSymbol: String = .empty
    var repoUrl: String = .empty
    var stars: Int = 0
    
}
