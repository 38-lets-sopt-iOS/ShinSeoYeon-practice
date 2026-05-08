import Foundation

final class UserService {
    static let shared = UserService()
    private init() {}

    private func makeGetRequest(userId: Int) throws -> URLRequest {
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

    private func makePatchRequest(
        userId: Int,
        body: Data?
    ) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }

        let path = "/api/v1/users/\(userId)"
        let url = baseURL + path

        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }

        var request = URLRequest(url: encodedURL)
        request.httpMethod = "PATCH"

        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }

        if let body = body {
            request.httpBody = body
        }

        return request
    }

    private func makePatchRequestBody(
        name: String?,
        email: String?,
        age: Int?
    ) -> Data? {
        do {
            let data = UserUpdateRequestDTO(
                name: name,
                email: email,
                age: age
            )

            let jsonEncoder = JSONEncoder()
            return try jsonEncoder.encode(data)
        } catch {
            print(error)
            return nil
        }
    }

    func getUserInfo(userId: Int) async throws -> UserInfoData {
        let request = try makeGetRequest(userId: userId)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        if let responseString = String(data: data, encoding: .utf8) {
            print("GET Response Body: \(responseString)")
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

    func patchUserInfo(
        userId: Int,
        name: String?,
        email: String?,
        age: Int?
    ) async throws -> UserInfoData {
        guard let body = makePatchRequestBody(
            name: name,
            email: email,
            age: age
        ) else {
            throw NetworkError.requestEncodingError
        }

        let request = try makePatchRequest(
            userId: userId,
            body: body
        )

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }

        if let responseString = String(data: data, encoding: .utf8) {
            print("PATCH Response Body: \(responseString)")
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
