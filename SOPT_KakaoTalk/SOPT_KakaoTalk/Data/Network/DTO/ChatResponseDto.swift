//
//  ChatResponseDto.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/11/24.
//

import Foundation

//MARK: - FetchChatResponseDto

struct FetchChatResponseDto: Codable {
    let statusCode: Int
    let success: Bool
    let message: String
    let data: ChatDto
}

struct ChatDto: Codable {
    let imageURL: String
    let chatInfo: [ChatInfo]

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case chatInfo
    }
}

struct ChatInfo: Codable {
    let chatImage: String
    let name, content, updatedAt: String
    
    func convertToChatModel() -> ChatModel {
        return ChatModel(profileImage: self.chatImage, name: self.name, message: self.content, time: self.updatedAt)
    }
}
