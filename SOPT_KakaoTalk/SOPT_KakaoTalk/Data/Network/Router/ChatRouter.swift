//
//  ChatRouter.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/11/24.
//

import Foundation
import UIKit

import Moya

enum ChatRouter {
    case fetchChat
}

extension ChatRouter: TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchChat:
            return "/chat/list"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchChat:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchChat:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
