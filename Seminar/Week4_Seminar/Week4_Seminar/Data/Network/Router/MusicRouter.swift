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
}

extension MusicRouter: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchSongs:
            return "/music/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchSongs:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchSongs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
