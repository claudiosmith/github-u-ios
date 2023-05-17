//
//  UserService.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import Foundation
import Combine

protocol UserServiceProtocol {

    func request() async throws -> [User]
    func request(login: String) async throws -> UserDetail
    func requestRepos(login: String) async throws -> [UserRepo]

}

struct UserService: UserServiceProtocol {

    func request() async throws -> [User] {

        do {
            let (data, _) = try await URLSession.shared.data(from: Endpoint.users.url)
            return try data.build(to: [User].self)
        } catch {
            throw error as? NetworkError ?? .genericError
        }
    }
    
    func request(login: String) async throws -> UserDetail {

        do {
            let (data, _) = try await URLSession.shared.data(from: Endpoint.user(with: login).url)
            return try data.build(to: UserDetail.self)
        } catch {
            throw error as? NetworkError ?? .genericError
        }
    }
    
    func requestRepos(login: String) async throws -> [UserRepo] {
        do {
            let (data, _) = try await URLSession.shared.data(from: Endpoint.user(with: login).url)
            return try data.build(to: [UserRepo].self)
        } catch {
            throw error as? NetworkError ?? .genericError
        }
    }

}
