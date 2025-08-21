//
//  KanjiInfo.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation

struct KanjiInfo: Hashable, Codable {
    let id: Int
    let kanji: String
    let strokes: Int?
    let jlptLevel: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case kanji = "kanji"
        case strokes = "strokes"
        case jlptLevel = "jlpt"
        case description = "description"
    }
}
