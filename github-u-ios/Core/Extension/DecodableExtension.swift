//
//  DecodableExtension.swift
//
//  Created by Claudio Smith
//

import Foundation

extension Decodable {
    
    static func parseFrom(jsonFile: String) -> Self? {

        guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let output = try? data.build(to: self)
        else {
            return nil
        }
        return output
    }
    
}
