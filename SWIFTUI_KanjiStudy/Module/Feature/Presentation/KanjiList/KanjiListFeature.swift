//
//  KanjiListFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import SwiftUI
import ComposableArchitecture

struct Step: Equatable {
    let jlptLevel: JLPT
    let count: Int
}

@Reducer
struct KanjiListFeature: Reducer {
    @Dependency(\.kanjiManager) var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        var steps: [Step] = []
        var selectedStepRow: Int? = nil
        var selectedStep: Step? = nil
        var selectedStepKanjiCount = 0
    }
    
    enum Action: Equatable {
        case onAppear
        case backBtnTapped
        case stepBtnTapped(Int)
        case stepDeselected
        case subStepTapped(Int)
        
        case delegate(Delegate)
    }
    
    enum Delegate: Equatable {
        case navigateToKanjiDetail(kanjiList: [KanjiInfo], jlptLevel: String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if state.steps.isEmpty {
                    state.steps = kanjiManager.groupKanjiByJLPTLevel().map {Step(jlptLevel: $0.key, count: $0.value.count)}.sorted {$0.jlptLevel.rawValue > $1.jlptLevel.rawValue}
                }
                return .none
                
            case .stepBtnTapped(let row):
                if state.selectedStep != nil {return .none}
                state.selectedStepRow = row
                state.selectedStep = state.steps[row]
                state.selectedStepKanjiCount = Int(ceil(Double(kanjiManager.kanjiList(forJLPTLevel: state.selectedStep?.jlptLevel.rawValue ?? "").count) / 10))
                return .none
                
            case .stepDeselected:
                state.selectedStep = nil
                state.selectedStepRow = nil
                return .none
                
            case .subStepTapped(let row):
                guard let selectedStep = state.selectedStep else {return .none}
                let kanjiList = kanjiManager.kanjiList(forJLPTLevel: selectedStep.jlptLevel.rawValue)
                let startIndex = row * 10
                
                return .send(.delegate(.navigateToKanjiDetail(kanjiList: Array(kanjiList[startIndex ..< min(startIndex + 10, kanjiList.count)]), jlptLevel: selectedStep.jlptLevel.rawValue)))
                
            default: return .none
            }
        }
    }
}
