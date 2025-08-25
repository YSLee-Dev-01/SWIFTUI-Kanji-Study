//
//  KanjiDetail.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/25/25.
//

import Foundation

struct KanjiDetail: Hashable, Encodable {
    let kanji: String
    let onyomi: [String] // 음독
    let kunyomi: [String] // 훈독
}
