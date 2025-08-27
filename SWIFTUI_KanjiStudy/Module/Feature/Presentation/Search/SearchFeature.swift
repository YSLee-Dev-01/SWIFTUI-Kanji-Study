//
//  SearchFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/27/25.
//

import Foundation
import ComposableArchitecture

struct SearchInfo: Equatable {
    var isFavoriteWord: Bool
    var kanji: String
}

@Reducer
struct SearchFeature: Reducer {
    @Dependency(\.kanjiManager) private var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        var insertedText: String = ""
        var searchResult: [SearchInfo] = []
        var searchLoading = false
        
        @Shared(.favoriteWords) var favoriteWords: [String] = []
    }
    
    enum Action: Equatable {
        case backBtnTapped
        case textInserted(String)
        case searchRequest
        case starBtnTapped(Int)
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
                state.searchResult = kanjiManager.findKanji(by: state.insertedText).map {SearchInfo(isFavoriteWord: state.favoriteWords.contains($0), kanji: $0)}
                state.searchLoading = false
                return .none
                
            case .starBtnTapped(let row):
                var tappedData = state.searchResult[row]
                tappedData.isFavoriteWord.toggle()
                state.searchResult[row] = tappedData
                
                state.$favoriteWords.toggleFavoriteWord(tappedData.kanji)
                
                return .none
                
            default: return .none
            }
        }
    }
}
