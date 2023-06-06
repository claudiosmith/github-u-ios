import Foundation

enum NetworkError: LocalizedError, Equatable {
    
    case missingData
    case genericError
    case decodeFail
    case noInternet
    case statusCode(_ statusCode: Int, _ customMessage: String?)
    case custom(_ message: String)
    case unknown

    var localizedDescription: String {
        switch self {
        case .missingData:
            return Locator.missingData.localize
        case .genericError:
            return Locator.genericError.localize
        case .unknown:
            return Locator.unknownError.localize
        case .decodeFail:
            return Locator.decodeFail.localize
        case .noInternet:
            return Locator.noInternet.localize
        case .statusCode(let statusCode, _):
            return checkStatusCodeError(statusCode)
        case .custom(let message):
            return message
        }
    }

    private func checkStatusCodeError(_ statusCode: Int) -> String {
        switch statusCode {
        case 404:
            return Locator.serviceNotFound.localize
        case 500...599:
            return Locator.serverNotFound.localize
        default:
            return NetworkError.genericError.localizedDescription
        }
    }
}

extension NetworkError: Identifiable {
    var id: String { return .empty }
}

struct ErrorVerifier {
    
    static func build(from response: URLResponse, data: Data? = nil) throws {
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.missingData
        }

        if 200...299 ~= response.statusCode { return }

        let responseObject = try? data?.toDictionary()
        let errorMessage = responseObject?["message"] as? String
        throw NetworkError.statusCode(response.statusCode, errorMessage)
    }

}
