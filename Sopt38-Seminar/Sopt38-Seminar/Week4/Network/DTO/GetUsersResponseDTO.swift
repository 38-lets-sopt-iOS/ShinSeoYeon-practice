import Foundation

struct GetUsersListResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UsersData
}

struct UsersData: Decodable {
    let users: [UserData]
}

struct UserData: Decodable {
    let id: Int
    let name: String
    let part: String
}
