//
//  GanaManagerProtocol.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/19/25.
//

import Foundation

protocol GanaManagerProtocol {
    func getGiragana() -> [[String]]
    func getKatakana() -> [[String]]
    func convertKana(at indexPath: IndexPath, from sourceType: KanaType) -> String 
}
