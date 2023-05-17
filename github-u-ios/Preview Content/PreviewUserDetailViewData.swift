//
//  PreviewUserDetailViewData.swift
//  github-u-ios
//
//  Created by Claudio Smith on 16/05/23.
//

import Foundation

extension UserDetailViewData {
    
    static let viewdata = UserDetailViewData(login: "torvalds",
                                             name: "Linus Torvalds",
                                             reposURL: URL(string: "https://api.github.com/users/torvalds/repos") ??
                                                       URL(fileURLWithPath: .empty),
                                             location: "Portland, OR",
                                             followers: "182604",
                                             avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1024025?v=4") ??
                                                        URL(fileURLWithPath: .empty))
}
