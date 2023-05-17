//
//  PreviewUserViewData.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import Foundation

extension  UserViewData {
    
    static let viewdata = UserViewData(login: "mojombo",
                                       htmlUrl: "https://github.com/mojombo",
                                       avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1?v=4") ??
                                                 URL(fileURLWithPath: .empty))
    
}
