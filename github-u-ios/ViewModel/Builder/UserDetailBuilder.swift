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
        
        let reposUrl = URL(string: detail.reposURL) ?? URL(fileURLWithPath: .empty),
        avatarUrl = URL(string: detail.avatarUrl) ?? URL(fileURLWithPath: .empty)
        
        userData = UserDetailViewData(login: user.login,
                                      name: detail.name ?? user.login,
                                      reposURL: reposUrl,
                                      location: detail.location ?? Locator.unknown.localize,
                                      followers: detail.followers?.description ?? .empty,
                                      avatarUrl: avatarUrl)
    }
    
    public func build() -> UserDetailViewData { userData }
}
