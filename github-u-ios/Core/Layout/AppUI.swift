//
//  AppUI.swift
//

import SwiftUI

struct AppUI {
    
    static func layout() {
        
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .white
        
        UICollectionView.appearance().contentInset.top = -30
        
    }

    static let layerWidth: CGFloat = UIScreen.main.bounds.width - 30
}

extension UINavigationController {
    
    override open func viewWillLayoutSubviews() {
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.configureWithTransparentBackground()
        navbarAppearance.backgroundColor = .black
        navbarAppearance.shadowColor = .black
        
        navbarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = navbarAppearance
        navigationBar.compactAppearance = navbarAppearance
        navigationBar.scrollEdgeAppearance = navbarAppearance
        
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
}
