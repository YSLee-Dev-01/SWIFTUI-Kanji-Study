//
//  SearchFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/27/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SearchFeature: Reducer {
    @Dependency(\.kanjiManager) private var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        var insertedText: String = ""
        var searchResult: [String] = []
        var searchLoading = false
    }
    
    enum Action: Equatable {
        case backBtnTapped
        case textInserted(String)
        case searchRequest
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .textInserted(let text):
                state.insertedText = text
                if text.isEmpty {
                    state.searchResult = []
                    return .none
                } else {
                    state.searchLoading = true
                    return .send(.searchRequest).debounce(id: "SearchRequest", for: 0.2, scheduler: DispatchQueue.main)
                }
               
            case .searchRequest:
                state.searchResult = kanjiManager.findKanji(by: state.insertedText)
                state.searchLoading = false
                return .none
                
            default: return .none
            }
        }
    }
}
