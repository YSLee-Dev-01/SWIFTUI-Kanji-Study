//
//  KanjiManagerProtocol.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation

protocol KanjiManagerProtocol {
    func groupKanjiByJLPTLevel() -> [JLPT: [KanjiInfo]]
    func kanjiList(forJLPTLevel level: String) -> [KanjiInfo]
    func findKanjiDetail(by kanji: String) -> KanjiDetail?
    func findKanjiGroup(by kanji: String) -> (kanjiList: [KanjiInfo], jlptLevel: String, row: Int)?
}
