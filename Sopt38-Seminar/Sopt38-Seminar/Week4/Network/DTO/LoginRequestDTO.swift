//
//  LoginRequestDTO.swift
//  Sopt38-Seminar
//
//  Created by 신서연 on 5/8/26.
//

import Foundation

struct LoginRequestDTO: Encodable {
    let loginId: String
    let password: String
}
