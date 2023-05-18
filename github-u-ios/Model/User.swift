//
//  User.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import Foundation

struct User: Decodable {
    
    let login: String
    let avatarURL: String
    let htmlURL: String
    
    enum CodingKeys: String, CodingKey {
        case login, avatarURL = "avatar_url", htmlURL = "html_url"
    }
}

struct UserDetail: Decodable {
    
    let name: String?
    let reposURL: String
    let location: String?
    let followers: Int?
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name, reposURL = "repos_url", location, followers, avatarUrl = "avatar_url"
    }
    
}

struct UserRepo: Decodable {
    
    let repoURL: String
    let stargazersCount: Int
    
    enum CodingKeys: String, CodingKey {
        case repoURL = "html_url", stargazersCount = "stargazers_count"
    }
    
}
