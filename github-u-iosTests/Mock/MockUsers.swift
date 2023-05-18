//
//  MockUsers.swift
//  github-u-iosTests
//
//  Created by Claudio Smith on 18/05/23.
//

import SwiftUI
@testable import github_u_ios

struct MockUsers {
    
    static func getUsers() -> [User]? {
        
        guard let usersParsed = [User].parseFrom(jsonFile: "users") else {
            return nil
        }
        return usersParsed
    }
    
}
