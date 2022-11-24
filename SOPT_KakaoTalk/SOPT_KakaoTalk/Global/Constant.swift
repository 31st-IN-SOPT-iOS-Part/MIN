//
//  Constant.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/11/24.
//

import Foundation

// MARK: - Environment

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
