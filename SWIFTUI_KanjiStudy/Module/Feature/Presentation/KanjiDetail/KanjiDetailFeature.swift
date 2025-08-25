//
//  KanjiDetailFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/25/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct KanjiDetailFeature: Reducer {
    @Dependency(\.kanjiManager) private var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        let kanjiList: [KanjiInfo]
        let jlptLevel: String
        var selectedKanjiRow: Int?
        var selectedKanjiDetailInfo: KanjiDetail?
        
        init(kanjiList: [KanjiInfo], jlptLevel: String) {
            self.kanjiList = kanjiList
            self.jlptLevel = jlptLevel
        }
    }
    
    enum Action: Equatable {
        case backBtnTapped
        case kanjiSelected(Int)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .kanjiSelected(let row):
                state.selectedKanjiRow = state.selectedKanjiRow == row ? nil : row
                state.selectedKanjiDetailInfo = state.selectedKanjiRow == nil ?  nil : kanjiManager.findKanjiDetail(by: state.kanjiList[state.selectedKanjiRow!].kanji)
                return .none
                
            default: return .none
            }
        }
    }
}
