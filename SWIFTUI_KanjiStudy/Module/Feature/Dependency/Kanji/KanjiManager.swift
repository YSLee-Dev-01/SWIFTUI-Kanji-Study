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
    
    // MARK: - LifeCycle
    
    private init() {
        self.kanjiList = self.loadKanjiData()
    }
    
    // MARK: - Methods
    
    func groupKanjiByJLPTLevel() -> [String: [KanjiInfo]] {
        return Dictionary(grouping: self.kanjiList) {
            $0.jlptLevel
        }
        .mapValues {$0.sorted {$0.id < $1.id}}
    }
}

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
}
