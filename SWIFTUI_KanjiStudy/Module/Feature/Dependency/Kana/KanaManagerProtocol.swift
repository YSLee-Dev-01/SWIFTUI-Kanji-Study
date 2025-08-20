//
//  KanaManagerProtocol.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/19/25.
//

import Foundation

protocol KanaManagerProtocol {
    func getHiragana() -> [[String]]
    func getKatakana() -> [[String]]
    func createKanaInfo(from kana: String, at indexPath: IndexPath, type: KanaType) -> KanaInfo 
}
