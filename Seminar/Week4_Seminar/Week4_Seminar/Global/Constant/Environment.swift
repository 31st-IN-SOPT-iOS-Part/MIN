//
//  Environment.swift
//  Week4_Seminar
//
//  Created by 김민 on 2022/11/24.
//

import Foundation

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
