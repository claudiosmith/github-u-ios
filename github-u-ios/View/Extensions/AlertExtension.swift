//
//  AlertExtension.swift
//
//  Created by Claudio Smith
//

import SwiftUI

extension Alert {
    
    init(errorMessage: String, action: (() -> Void)?) {
        
        let errorTitle = Locator.error.localize,
            cancelText = Locator.cancel.localize

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

    init(error: NetworkError, action: @escaping (() -> Void)) {
        
        let title = error == NetworkError.missingData ? Locator.info.localize
                                                      : Locator.error.localize
        let message = error.localizedDescription
        let cancelText = Locator.cancel.localize
        
        self = Alert(title: Text(title),
               message: Text(message),
               dismissButton: .destructive(
                 Text(cancelText), action: { action() }
               )
        )
    }
    
}
