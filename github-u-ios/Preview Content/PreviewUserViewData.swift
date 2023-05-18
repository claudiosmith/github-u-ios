//
//  PreviewUserViewData.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import Foundation

extension UserViewData {
    
    static let viewdata = UserViewData(login: "mojombo",
                                       htmlUrl: "https://github.com/mojombo",
                                       avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1?v=4") ??
                                                 URL(fileURLWithPath: .empty))
    
    static let viewdata1 = UserViewData(login: "torvalds",
                                        htmlUrl: "https://github.com/torvalds",
                                        avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/1024025?v=4") ??
                                                  URL(fileURLWithPath: .empty))
    
    static let list = [viewdata, viewdata1]
    
}
