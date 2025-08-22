//
//  KanjiManagerProtocol.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation

protocol KanjiManagerProtocol {
    func groupKanjiByJLPTLevel() -> [String: [KanjiInfo]]
    func kanjiList(forJLPTLevel level: String) -> [KanjiInfo] 
}
