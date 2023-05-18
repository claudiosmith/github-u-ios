import Foundation

extension Data {
    
    func build<Model: Decodable>(to objectType: Model.Type) throws -> Model {

        do {
            
            let object = try JSONDecoder().decoder.decode(objectType, from: self)
            if object is Array<Any> {
                guard let array = object as? Array<Any>, array.count > 0 else {
                    throw NetworkError.missingData
                }
            }
            return object
        } catch {
            debugPrint(error)
            throw error
        }
    }
    
    func toDictionary() throws -> [String: AnyObject]? {

        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? [String: AnyObject]
            return json
        } catch {
            debugPrint(error)
            throw NetworkError.decodeFail
        }
    }
    
    var prettyString: NSString {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return NSString() }

        return prettyPrintedString
    }
    
}
