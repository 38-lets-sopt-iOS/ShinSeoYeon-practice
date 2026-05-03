import Foundation

final class GetUsersListService {
    static var shared = GetUsersListService()
    private init() {}
    
    private func makeRequest(body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = "/api/v1/users"
        let url = baseUrl + path
        print(url)
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedurl)
        
        request.httpMethod = "GET"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")
        }
        
        return request
    }
    
    func getUsersList() async throws -> [UserData] {
        let request = try makeRequest(body: nil)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        do{
            let decoded = try JSONDecoder().decode(GetUsersListResponseDTO.self, from: data)
            return decoded.data.users
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }
}
