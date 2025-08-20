//
//  KanaInfo.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/20/25.
//

import Foundation

struct KanaInfo: Equatable {
    let hiragana: String
    let katakana: String
    let originalKanaType: KanaType
    let englishPronunciation: String
    let koreanPronunciation: String
    
    var originalKana: String {
        originalKanaType  == .hiragana ? hiragana : katakana
    }
    
    var otherKana: String {
        originalKanaType == .hiragana ? katakana : hiragana
    }
}
