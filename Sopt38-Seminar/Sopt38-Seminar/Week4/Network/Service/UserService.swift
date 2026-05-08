import Foundation

final class UserService {
    static let shared = UserService()
    private init() {}

    private func makeRequest(userId: Int) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }

        let path = "/api/v1/users/\(userId)"
        let url = baseURL + path

        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }

        var request = URLRequest(url: encodedURL)
        request.httpMethod = "GET"

        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        return request
    }

    func getUserInfo(userId: Int) async throws -> UserInfoData {
        let request = try makeRequest(userId: userId)

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
            let decoded = try JSONDecoder().decode(UserInfoResponseDTO.self, from: data)

            guard let userData = decoded.data else {
                throw NetworkError.responseDecodingError
            }

            return userData
        } catch {
            throw NetworkError.responseDecodingError
        }
    }

    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
