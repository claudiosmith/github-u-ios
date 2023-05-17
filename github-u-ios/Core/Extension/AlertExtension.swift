//
//  AlertExtension.swift
//  github-u-ios
//
//  Created by Claudio Smith on 17/05/23.
//

import SwiftUI

extension Alert {
    
    init(errorMessage: String, action: (() -> Void)?) {
        
        let errorTitle = "Erro",
            cancelText = "Cancelar"

        guard let action = action else {
            self = Alert(title: Text(errorTitle),
                  message: Text(errorMessage),
                  dismissButton: .destructive(
                    Text(cancelText)
                  )
            )
            return
        }
        
        self = Alert(title: Text(errorTitle),
              message: Text(errorMessage),
              dismissButton: .destructive(
                Text(cancelText), action: { action() }
              )
        )
    }

}