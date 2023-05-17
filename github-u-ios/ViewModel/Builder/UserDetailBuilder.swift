//
//  UserBuilder.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

final class UserDetailBuilder: Building {
    
    private lazy var userData = UserDetailViewData()
    lazy var user: UserViewData = UserViewData()
    
    init() {}
    
    var detail: UserDetail? {
        didSet {
            setUsers()
        }
    }

    private func setUsers() {

        guard let detail = detail else { return }
        
        let reposUrl = URL(string: detail.reposURL) ?? URL(fileURLWithPath: ""),
            avatarUrl = URL(string: detail.avatarUrl) ?? URL(fileURLWithPath: "")
        
        userData = UserDetailViewData(login: user.login,
                                      name: detail.name,
                                      reposURL: reposUrl,
                                      location: detail.location,
                                      followers: detail.followers.description,
                                      avatarUrl: avatarUrl)
    }
    
    public func build() -> UserDetailViewData { userData }
}
