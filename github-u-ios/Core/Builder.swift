
import Foundation

protocol Building { init() }

extension Building {
    
    typealias BuilderParameter = (inout Self) -> Void
    
    static func this(_ with: BuilderParameter) -> Self {
        var instance = self.init()
        with(&instance)
        return instance
    }
}

final class Builder: Building {
    required init() {}
}
