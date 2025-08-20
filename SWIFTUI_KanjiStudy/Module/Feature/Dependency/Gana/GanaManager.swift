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
    
    func convertKana(at indexPath: IndexPath, from sourceType: KanaType) -> String  {
        if sourceType == .hiragana {
           return getKatakana()[indexPath.section][indexPath.row]
        } else {
            return getHiragana()[indexPath.section][indexPath.row]
        }
    }
}
