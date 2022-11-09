//
//  UserRequestDto.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/09.
//

import Foundation

// MARK: - SignupRequestDto

struct SignupRequestDto: Codable {
    var email: String
    var password: String
    var name: String
}
