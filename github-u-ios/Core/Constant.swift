
import SwiftUI

enum LayoutUserRow {
    static let height: CGFloat = 90
    static let imageWidth: CGFloat = 60
    static let imageHeight: CGFloat = 60
    static let textWidth: CGFloat = UIScreen.main.bounds.width - imageWidth - 68
}

enum LayoutUserDetail {
    static let height: CGFloat = UIScreen.main.bounds.height / 2 - 20
    static let width: CGFloat = UIScreen.main.bounds.width - 42
    static let imageHeight: CGFloat = UIScreen.main.bounds.height / 2 - 10
}

enum LayoutUserRepo {
    static let height: CGFloat = 100
    static let width: CGFloat = UIScreen.main.bounds.width - 62
}
