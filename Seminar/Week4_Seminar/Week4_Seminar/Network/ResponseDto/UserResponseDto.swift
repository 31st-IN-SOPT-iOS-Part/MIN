//
//  UserResponseDto.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/09.
//

import Foundation

// MARK: - SignupResponseDto

struct SignupResponseDto: Codable {
    let status: Int
    let message: String
    let newUser: NewUser?
}

struct NewUser: Codable {
    let id: Int
    let name: String
    let profileImage: String?
    let bio: String?
    let email: String
    let password: String
}

// MARK: - LoginResponseDto

struct LoginResponseDto: Codable {
    let status: Int
    let message: String
    let result: Results?
}

struct Results: Codable {
    let id: Int
    let name: String
    let profileImage: String?
    let bio: String?
    let email: String
    let password: String
}

