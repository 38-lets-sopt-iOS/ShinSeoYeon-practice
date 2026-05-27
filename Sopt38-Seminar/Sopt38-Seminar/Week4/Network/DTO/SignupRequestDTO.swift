import Foundation

struct SignupRequestDTO: Encodable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String

}
