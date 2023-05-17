import Foundation

enum NetworkError: LocalizedError {
    
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
            return "Dados vazios ou inválidos."
        case .genericError:
            return "Sua requisição não pode ser completada."
        case .unknown:
            return "Um erro ocorreu ao decodificar os dados."
        case .decodeFail:
            return "Ocorreu um erro desconhecido."
        case .noInternet:
            return "Não há conexão de internet disponível."
        case .statusCode(let statusCode, let message):
            guard let message = message else {
                return checkStatusCodeError(statusCode)
            }
            return message
        case .custom(let message):
            return message
        }
    }

    private func checkStatusCodeError(_ statusCode: Int) -> String {
        switch statusCode {
        case 404:
            return "Serviço não encontrado."
        case 500...599:
            return "Servidor  não encontrado."
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
    
    static func build(from response: URLResponse, error: Error?, data: Data? = nil) throws {
        
        guard error == nil, let response = response as? HTTPURLResponse else {
            throw NetworkError.missingData
        }

        if 200...299 ~= response.statusCode && error == nil {
            return
        }

        let responseObject = try? data?.toDictionary()
        let errorMessage = responseObject?["message"] as? String
        throw NetworkError.statusCode(response.statusCode, errorMessage)
    }
}
