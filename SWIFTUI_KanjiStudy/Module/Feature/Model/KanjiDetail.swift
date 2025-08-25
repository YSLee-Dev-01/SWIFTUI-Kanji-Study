//
//  KanjiDetail.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/25/25.
//

import Foundation

struct KanjiDetail: Hashable, Codable {
    let onyomi: [String] // 음독
    let kunyomi: [String] // 훈독
    
    enum CodingKeys: String, CodingKey {
        case onyomi = "readings_on"
        case kunyomi = "readings_kun"
    }
}
