//
//  MusicResponseDto.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/24.
//

import Foundation

//MARK: - FetchMusicResponseDto

struct FetchMusicResponseDto: Codable {
    let statusCode: Int
    let success: Bool
    let message: String
    let data: [MusicDto]
}

struct MusicDto: Codable {
    let id: Int
    let image: String
    let title, singer: String
    
    func converToMusic() -> MusicModel {
        return MusicModel(albumImage: self.image, title: self.title, singer: self.singer)
    }
}

// MARK: - AddSongResponseDto

struct AddSongResponseDto: Codable {
    let statusCode: Int
    let success: Bool
    let message: String
    let data: MusicDto
}


