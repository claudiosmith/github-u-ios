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

        let uniqueSelf = self
        users.forEach { user in

            let urlImage = URL(string: user.avatarURL) ?? URL(fileURLWithPath: .empty)
            
            let viewData = UserViewData(login: user.login, htmlUrl: user.htmlURL, avatarUrl: urlImage)
            uniqueSelf.usersData.append(viewData)
        }
        
        usersData = usersData.sorted { (user1, user2) -> Bool in
                    let login1 = user1.login
                    let login2 = user2.login
                    return (login1.localizedCaseInsensitiveCompare(login2) == .orderedAscending)
        }
    }
    
    public func build() -> [UserViewData] { usersData }
}
