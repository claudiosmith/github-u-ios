//
//  ViewExtension.swift
//
//  Created by Claudio Smith
//

import SwiftUI

extension View {

    func progressView(state: LoaderState = .loading) -> some View {
        
        guard state == .loading else {
            return AnyView(EmptyView())
        }
        
        return AnyView(ProgressView().progressViewStyle(.automatic)
                                     .frame(width: 40, height: 40, alignment: .center)
                                     .tint(.white))
    }

}
