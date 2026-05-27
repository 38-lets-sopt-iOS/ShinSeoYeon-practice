//
//  LoginResponseDTO.swift
//  Sopt38-Seminar
//
//  Created by 신서연 on 5/8/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: LoginData?
    let meta: ErrorResponseDTO?
}

struct LoginData: Decodable {
    let userId: Int
}
