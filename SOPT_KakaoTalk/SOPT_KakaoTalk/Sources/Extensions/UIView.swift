//
//  UIView.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/13.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        _ = views.map { self.addSubview($0) }
    }
}


