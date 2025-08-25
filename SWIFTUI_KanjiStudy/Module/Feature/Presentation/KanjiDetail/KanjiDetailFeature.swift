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
    @ObservableState
    struct State: Equatable {
        let kanjiList: [KanjiInfo]
        let selectedJLPTLevel: String
        
        init(kanjiList: [KanjiInfo], selectedJLPTLevel: String) {
            self.kanjiList = kanjiList
            self.selectedJLPTLevel = selectedJLPTLevel
        }
    }
    
    struct Action: Equatable {
        
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
    }
}
