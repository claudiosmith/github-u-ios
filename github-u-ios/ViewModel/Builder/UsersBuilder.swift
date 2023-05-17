//
//  UserBuilder.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

final class UsersBuilder: Building {
    
    private lazy var usersData = [UserViewData]()
    
    init() {}
    
    var users: [User]? {
        didSet {
            setUsers()
        }
    }

    private func setUsers() {

        guard let users = users else { return }

        let strongself = self
        users.forEach { user in

            let urlImage = URL(string: user.avatarURL) ?? URL(fileURLWithPath: "")
            
            let viewData = UserViewData(login: user.login, htmlUrl: user.htmlURL, avatarUrl: urlImage)
            strongself.usersData.append(viewData)
        }
    }
    
    public func build() -> [UserViewData] { usersData }
}
