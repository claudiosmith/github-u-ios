//
//  MockUserService.swift
//  github-u-iosTests
//
//  Created by Claudio Smith on 17/05/23.
//

import Foundation
@testable import github_u_ios

class MockUserService: UserServiceProtocol {
    var requestCalled = false
    var requestLoginCalled = false
    var requestReposCalled = false

    func request() async throws -> [User] {
        requestCalled = true
        return []
    }

    func request(login: String) async throws -> UserDetail {
        requestLoginCalled = true
        let userDetail = UserDetail(name: "Linus Torvalds",
                                    reposURL: "https://api.github.com/users/torvalds/repos",
                                    location: "Portland, OR",
                                    followers: 182604,
                                    avatarUrl: "https://avatars.githubusercontent.com/u/1024025?v=4")
        return userDetail
    }

    func requestRepos(login: String) async throws -> [UserRepo] {
        requestReposCalled = true
        return []
    }
}
