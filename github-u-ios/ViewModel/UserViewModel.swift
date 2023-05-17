//
//  UserViewModel.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI
import Combine

@MainActor
final class UserViewModel: ObservableObject {
    
    enum State {
        case idle, loading
    }
    
    @Published var usersViewData: [UserViewData] = []
    @Published var reposViewData: [UserRepoViewData] = []
    @Published var detailViewData = UserDetailViewData()
    @Published var errorNet: NetworkError?
    
    var state: State = .idle
    let service: UserServiceProtocol
    
    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }
    
    func fetchUsers() async {
        
        state = .loading
        do {
            let users = try await service.request()
            state = .idle
            usersViewData = UsersBuilder.this {
                $0.users = users
            }.build()
            
        } catch {
            state = .idle
            errorNet = error as? NetworkError
        }
        
    }
    
    func fetchUserDetail(userViewdata: UserViewData) async {
        
        state = .loading
        do {
            let detail = try await service.request(login: userViewdata.login)
            state = .idle
            detailViewData = UserDetailBuilder.this {
                $0.user = userViewdata
                $0.detail = detail
            }.build()
            
        } catch {
            state = .idle
            errorNet = error as? NetworkError
        }
    }
    
    func fetchRepos(detailViewdata: UserDetailViewData) async {
        
        state = .loading
        do {
            let repos = try await service.requestRepos(login: detailViewdata.login)
            state = .idle
            reposViewData = UserRepoBuilder.this {
                $0.repos = repos
            }.build()
            
        } catch {
            state = .idle
            errorNet = error as? NetworkError
        }
        
    }
}
