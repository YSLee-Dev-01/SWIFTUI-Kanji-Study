//
//  KanjiManager.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation

struct KanjiManager: KanjiManagerProtocol {
    
    // MARK: - Properties
    
    static var shared = KanjiManager()
    
    private var kanjiList: [KanjiInfo] = []
    private var kanjiDict: [JLPT: [KanjiInfo]] = [:]
    private var kanjiDetailDict: [String: KanjiDetail] = [:]
    
    // MARK: - LifeCycle
    
    private init() {
        self.kanjiList = self.loadKanjiData()
        self.updateKanjiDict()
        self.kanjiDetailDict = self.loadKanjiDetails()
    }
    
    // MARK: - Methods
    
    func groupKanjiByJLPTLevel() -> [JLPT: [KanjiInfo]] {
        return self.kanjiDict
    }
    
    func kanjiList(forJLPTLevel level: String) -> [KanjiInfo] {
        guard let jlptLevel = JLPT(rawValue: level) else {return []}
        return self.kanjiDict[jlptLevel] ?? []
    }
    
    func findKanjiDetail(by kanji: String) -> KanjiDetail? {
        return self.kanjiDetailDict[kanji]
    }
}

// MARK: - extension

private extension KanjiManager {
    func loadKanjiData() -> [KanjiInfo] {
        guard let url = Bundle.main.url(forResource: "kanji", withExtension: "json"),
                      let data = try? Data(contentsOf: url)
        else { return [] }
        
        let jsonDecoder = JSONDecoder()
        do {
            let result = try  jsonDecoder.decode([KanjiInfo].self, from: data)
            return result
        } catch(let error) {
            print("KanjiManager > 한자를 불러오는 중 오류 발생 \(error)")
            return []
        }
    }
    
    mutating func updateKanjiDict() {
        self.kanjiDict = Dictionary(grouping: self.kanjiList) {
            $0.jlptLevel
        }
        .mapValues {$0.sorted {$0.id < $1.id}}
    }
    
    func loadKanjiDetails() -> [String: KanjiDetail] {
        guard let url = Bundle.main.url(forResource: "kanjiDetail", withExtension: "json"),
                      let data = try? Data(contentsOf: url)
        else { return [:] }
        
        let jsonDecoder = JSONDecoder()
        do {
            let result = try  jsonDecoder.decode([String: KanjiDetail].self, from: data)
            return result
        } catch(let error) {
            print("KanjiManager > 한자를 불러오는 중 오류 발생 \(error)")
            return [:]
        }
    }
}
