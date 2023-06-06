//
//  Localization.swift
//  github-u-ios
//
//  Created by Claudio Smith on 19/05/23.
//

import Foundation

enum Locator: String {
    
    case appTitle,  location, followers, seeRepos, reposOf,
         unknown, cancel, error, info, missingData, genericError,
         unknownError, decodeFail, noInternet, serviceNotFound,
         serverNotFound
    
}

extension Locator {
    
    var localize: String {
        NSLocalizedString(self.rawValue, comment: .empty)
    }
}
