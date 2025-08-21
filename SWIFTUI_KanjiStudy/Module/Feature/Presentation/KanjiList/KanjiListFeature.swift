//
//  KanjiListFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation
import ComposableArchitecture

struct Step: Equatable {
    let title: String
    let count: Int
}

@Reducer
struct KanjiListFeature: Reducer {
    @Dependency(\.kanjiManager) var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        var steps: [Step] = []
    }
    
    enum Action: Equatable {
        case onAppear
        case backBtnTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if state.steps.isEmpty {
                    state.steps = kanjiManager.groupKanjiByJLPTLevel().map {Step(title: $0.key, count: $0.value.count)}.sorted {$0.title > $1.title}
                }
                return .none
                
            default: return .none
            }
        }
    }
}
