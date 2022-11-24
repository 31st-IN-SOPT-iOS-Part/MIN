//
//  MusicRouter.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/24.
//

import Foundation
import UIKit

import Moya

enum MusicRouter {
    case fetchSongs
    case addSong(param: AddSongRequestDto)
}

extension MusicRouter: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchSongs:
            return "/music/list"
        case .addSong(param: _):
            return "/music"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchSongs:
            return .get
        case .addSong(param: _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchSongs:
            return .requestPlain
        case .addSong(param: let param):
            var multipartFormData: [MultipartFormData] = []
            
            /// image Data to MultipartFormData
            let imageData = MultipartFormData(provider: .data(param.image),
                                              name: "image",
                                              fileName: "image.jpeg",
                                              mimeType: "image/jpeg")
            multipartFormData.append(imageData)
            
            let jsonParam = ["singer": param.singer, "title": param.title]
            
            /// Dictionary to JSON
            let data = try! JSONSerialization.data(withJSONObject: jsonParam.asParameter(), options: .prettyPrinted)
            
            /// JSON object to JSON String
            let jsonString = String(data: data, encoding: .utf8)!
            
            /// JSON String to MultipartFormData
            let stringData = MultipartFormData(provider: .data(jsonString.data(using: String.Encoding.utf8)!),
                                               name: "request",
                                               mimeType: "application/json")
            multipartFormData.append(stringData)
            
            return .uploadMultipart(multipartFormData)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .addSong:
            return ["Content-Type": "multipart/form-data"]
        default:
            return ["Content-Type": "application/json"]
        }
    }
    
    
}
