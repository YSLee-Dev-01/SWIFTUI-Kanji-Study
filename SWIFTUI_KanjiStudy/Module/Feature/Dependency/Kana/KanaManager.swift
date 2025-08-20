//
//  KanaManager.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/19/25.
//

import Foundation

struct KanaManager: KanaManagerProtocol {
    
    // MARK: - Properties
    
    static var shared = KanaManager()
    
    // MARK: - LifeCycle
    
    private init() {}
    
    // MARK: - Methods
    
    func getHiragana() -> [[String]] {
        return KanaConstants.hiragana
    }
    
    func getKatakana() -> [[String]] {
        return KanaConstants.katakana
    }
    
    func createKanaInfo(at indexPath: IndexPath, type: KanaType) -> KanaInfo {
        let originalKana = type == .hiragana ? getHiragana()[indexPath.section][indexPath.row] : getKatakana()[indexPath.section][indexPath.row]
        let otherKana = convertKana(at: indexPath, from: type)
        let pronunciations = KanaConstants.pronunciations[indexPath.section][indexPath.row]
        return .init(hiragana: type == .hiragana ? originalKana : otherKana, katakana: type == .katakana ? originalKana : otherKana, originalKanaType: type, englishPronunciation: pronunciations.1, koreanPronunciation: pronunciations.0)
    }
}

private extension KanaManager {
    func convertKana(at indexPath: IndexPath, from sourceType: KanaType) -> String  {
        if sourceType == .hiragana {
           return getKatakana()[indexPath.section][indexPath.row]
        } else {
            return getHiragana()[indexPath.section][indexPath.row]
        }
    }
}
