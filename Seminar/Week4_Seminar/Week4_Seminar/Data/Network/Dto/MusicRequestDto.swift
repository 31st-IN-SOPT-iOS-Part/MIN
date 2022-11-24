//
//  MusicRequestDto.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/24.
//

import Foundation

//MARK: - AddSongRequestDto

struct AddSongRequestDto: Codable {
    let image: Data
    let title: String
    let singer: String
}
