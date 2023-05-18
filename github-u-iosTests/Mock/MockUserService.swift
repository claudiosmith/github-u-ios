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
        let userDetail = UserDetail(name: "John Doe",
                                    reposURL: "https://example.com/repos",
                                    location: "New York",
                                    followers: 100,
                                    avatarUrl: "https://example.com/avatar.jpg")

        return userDetail
    }

    func requestRepos(login: String) async throws -> [UserRepo] {
        requestReposCalled = true
        return []
    }
}
