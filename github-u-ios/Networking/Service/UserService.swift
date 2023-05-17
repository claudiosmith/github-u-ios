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
        guard Connection.isConnectedToNetwork() else { throw NetworkError.noInternet }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: Endpoint.users.url)
            try ErrorVerifier.build(from: response, data: data)
            return try data.build(to: [User].self)
        } catch {
            throw error as? NetworkError ?? .genericError
        }
    }
    
    func request(login: String) async throws -> UserDetail {
        
        guard Connection.isConnectedToNetwork() else { throw NetworkError.noInternet }

        do {
            let (data, response) = try await URLSession.shared.data(from: Endpoint.user(with: login).url)
            try ErrorVerifier.build(from: response, data: data)
            return try data.build(to: UserDetail.self)
        } catch {
            throw error as? NetworkError ?? .genericError
        }
    }
    
    func requestRepos(login: String) async throws -> [UserRepo] {
        guard Connection.isConnectedToNetwork() else { throw NetworkError.noInternet }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: Endpoint.userRepo(with: login).url)
            try ErrorVerifier.build(from: response, data: data)
            return try data.build(to: [UserRepo].self)
        } catch {
            throw error as? NetworkError ?? .genericError
        }
    }

}
