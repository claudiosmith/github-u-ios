//
//  NavigationDeepView.swift
//  github-u-ios
//
//  Created by Claudio Smith on 15/05/23.
//

import SwiftUI

struct NavigationDeepView: View {
    
    let title: String = "Usuários do GitHub"
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .trailing) {
                UserView()
            }
            
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationDeepView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDeepView()
    }
}
