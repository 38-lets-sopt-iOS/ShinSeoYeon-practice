import Foundation

final class LoginService {
    static let shared = LoginService()
    private init() {}

    private func makeRequestBody(
        loginId: String,
        password: String
    ) -> Data? {
        do {
            let data = LoginRequestDTO(
                loginId: loginId,
                password: password
            )

            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(data)
        } catch {
            print(error)
            return nil
        }
    }

    private func makeRequest(body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }

        let path = "/api/v1/auth/signin"
        let url = baseURL + path

        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }

        var request = URLRequest(url: encodedURL)
        request.httpMethod = "POST"

        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        if let body = body {
            request.httpBody = body
        }

        return request
    }

    func postLogin(
        loginId: String,
        password: String
    ) async throws -> LoginResponseDTO {
        guard let body = makeRequestBody(
            loginId: loginId,
            password: password
        ) else {
            throw NetworkError.requestEncodingError
        }

        let request = try makeRequest(body: body)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        if let responseString = String(data: data, encoding: .utf8) {
            print("Response Body: \(responseString)")
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(LoginResponseDTO.self, from: data)
        } catch {
            throw NetworkError.responseDecodingError
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
