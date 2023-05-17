//
//  github_u_iosApp.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

@main
struct github_u_iosApp: App {
    
    init() {
        AppDesignConfiguration.layout()    
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
