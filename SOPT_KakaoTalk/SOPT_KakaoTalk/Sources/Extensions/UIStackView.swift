//
//  UIStackView.swift
//  SOPT_KakaoTalk
//
//  Created by 김민 on 2022/10/14.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        _ = views.map { self.addArrangedSubview($0) }
    }
}

