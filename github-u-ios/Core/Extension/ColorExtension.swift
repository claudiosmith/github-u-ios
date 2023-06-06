//
//  ColorExtension.swift
//
//  Created by Claudio Smith
//

import UIKit
import SwiftUI

extension Color {

    private static let darkGray: UIColor = #colorLiteral(red: 0.1097066775, green: 0.1175378636, blue: 0.1218328848, alpha: 1)
    private static let darkOneGray: UIColor = #colorLiteral(red: 0.200694561, green: 0.200694561, blue: 0.200694561, alpha: 1)
    private static let darkLittleGray: UIColor = #colorLiteral(red: 0.1629017293, green: 0.1629017293, blue: 0.1629017293, alpha: 1)
    private static let grayWhite: UIColor = #colorLiteral(red: 0.910412721, green: 0.910412721, blue: 0.910412721, alpha: 1)

    static let rowColor: Color = Color(darkGray)
    static let rowRocketColor: Color = Color(darkOneGray)
    static let backRocketColor: Color = Color(darkLittleGray)
    static let frontRocketColor: Color = Color(grayWhite)
    
}
