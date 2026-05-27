import Foundation

struct UserInfoResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfoData?
    let meta: ErrorResponseDTO?
}

struct UserInfoData: Decodable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}

struct UserUpdateRequestDTO: Encodable {
    let name: String?
    let email: String?
    let age: Int?
}
