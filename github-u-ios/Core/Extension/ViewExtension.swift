//
//  ViewExtension.swift
//  github-u-ios
//
//  Created by Claudio Smith on 17/05/23.
//

import SwiftUI

extension View {
    
    static var progressView: some View {
        ProgressView().progressViewStyle(.automatic)
            .frame(width: 40, height: 40, alignment: .center)
            .tint(.white)
    }

}

