//
//  UsersViewModelTest.swift
//  github-u-iosTests
//
//  Created by Claudio Smith on 17/05/23.
//

import XCTest
@testable import github_u_ios

@MainActor
final class UserViewModelTests: XCTestCase {

    func testFetchUsers() async throws {
        
        let users = try XCTUnwrap(MockUsers.getUsers())
        let mockService = MockUserService()
        let viewModel = UserViewModel(service: mockService)

        await viewModel.fetchUsers()

        XCTAssertTrue(mockService.requestCalled)
        XCTAssertEqual(viewModel.state, .idle)
        XCTAssertEqual(viewModel.usersViewData[0].login, users[0].login)
        XCTAssertNil(viewModel.errorNet)
    }

    func testFetchUserDetail() async throws {
        
        let mockService = MockUserService()
        let viewModel = UserViewModel(service: mockService)
        let userViewData = UserViewData(login: "torvalds")

        await viewModel.fetchUserDetail(userViewdata: userViewData)

        XCTAssertTrue(mockService.requestLoginCalled)
        XCTAssertEqual(viewModel.state, .idle)
        XCTAssertEqual(viewModel.detailViewData.login, userViewData.login)
        XCTAssertNil(viewModel.errorNet)
        
    }

    func testFetchRepos() async throws {
        
        let mockService = MockUserService()
        let viewModel = UserViewModel(service: mockService)
        let detailViewData = UserDetailViewData(login: "torvalds")

        await viewModel.fetchRepos(detailViewdata: detailViewData)

        XCTAssertTrue(mockService.requestReposCalled)
        XCTAssertEqual(viewModel.state, .idle)
        XCTAssertEqual(viewModel.reposViewData, [])
        XCTAssertNil(viewModel.errorNet)
        
    }
}

