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
    func findKanji(by query: String) -> [String]
    func recommendKanjiList(exceptionKanjiList: [String], _ count: Int) -> [KanjiInfo] 
}

extension KanjiManagerProtocol {
    func recommendKanjiList(exceptionKanjiList: [String], _ count: Int = 25) -> [KanjiInfo] {
        recommendKanjiList(exceptionKanjiList: exceptionKanjiList, count)
    }
}
