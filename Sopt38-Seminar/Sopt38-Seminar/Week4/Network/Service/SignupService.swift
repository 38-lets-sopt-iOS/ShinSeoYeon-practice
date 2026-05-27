import Foundation

final class SignupService {
    static var shared = SignupService()
    private init() {}
    
    private func makeRequestBody(loginId: String,
                                 password: String,
                                 name: String,
                                 email: String,
                                 age: Int,
                                 part: String) -> Data?{
        do{
            let data = SignupRequestDTO(
                loginId: loginId,
                password: password,
                name: name,
                email: email,
                age: age,
                part: part
            )
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    private func makeRequest(body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = "/api/v1/auth/signup"
        let url = baseUrl + path
        print(url)
        guard let encodedurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedurl)
        
        request.httpMethod = "POST"
        
        
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
    
    func postSignup(loginId: String,
                    password: String,
                    name: String,
                    email: String,
                    age: Int,
                    part: String) async throws -> SignupResponseDTO {
        
        guard let body = makeRequestBody(loginId: loginId, password: password, name: name, email: email, age: age, part: part)
        else { throw NetworkError.requestEncodingError}
        
        let request = try makeRequest(body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)") //디버그용
        
        guard let httpRespones = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)") //디버그용
        
        if let responseString = String(data: data, encoding: .utf8) {
            print("Response Body: \(responseString)")
        }
        
        guard(200...299).contains(httpRespones.statusCode) else {
            throw configureHTTPError(errorCode: httpRespones.statusCode)
        }
        
        do{
            let decoded = try JSONDecoder().decode(SignupResponseDTO.self, from: data)
            print(decoded)
            return decoded
        } catch {
            throw error
        }
        
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
            return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
        }
    
}
