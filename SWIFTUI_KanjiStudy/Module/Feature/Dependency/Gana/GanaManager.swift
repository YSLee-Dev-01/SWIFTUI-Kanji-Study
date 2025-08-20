//
//  GanaManager.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/19/25.
//

import Foundation

struct GanaManager: GanaManagerProtocol {
    
    // MARK: - Properties
    
    static var shared = GanaManager()
    
    // MARK: - LifeCycle
    
    private init() {}
    
    // MARK: - Methods
    
    func getHiragana() -> [[String]] {
        return GanaConstants.hiragana
    }
    
    func getKatakana() -> [[String]] {
        return GanaConstants.katakana
    }
    
    func createKanaInfo(from kana: String, at indexPath: IndexPath, type: KanaType) -> KanaInfo {
        let otherKana = convertKana(at: indexPath, from: type)
        let pronunciations = GanaConstants.pronunciations[indexPath.section][indexPath.row]
        return .init(hiragana: type == .hiragana ? kana : otherKana, katakana: type == .katakana ? kana : otherKana, originalKanaType: type, englishPronunciation: pronunciations.1, koreanPronunciation: pronunciations.0)
    }
}

private extension GanaManager {
    func convertKana(at indexPath: IndexPath, from sourceType: KanaType) -> String  {
        if sourceType == .hiragana {
           return getKatakana()[indexPath.section][indexPath.row]
        } else {
            return getHiragana()[indexPath.section][indexPath.row]
        }
    }
}
