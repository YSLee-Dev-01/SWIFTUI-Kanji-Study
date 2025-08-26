//
//  KanjiDetailFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/25/25.
//

import Foundation
import ComposableArchitecture

struct KanjiDetailInfo: Equatable {
    var isFavoriteWord: Bool
    var kanjiInfo: KanjiInfo
}

@Reducer
struct KanjiDetailFeature: Reducer {
    @Dependency(\.kanjiManager) private var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        var kanjiList: [KanjiDetailInfo] = []
        let jlptLevel: String
        var selectedKanjiRow: Int?
        var selectedKanjiDetailInfo: KanjiDetail?
        @Shared(.favoriteWords) fileprivate var favoriteWords: [String] = []
        
        init(kanjiList: [KanjiInfo], jlptLevel: String, selectedKanjiRow: Int? = nil) {
            self.kanjiList = []
            self.jlptLevel = jlptLevel
            self.kanjiList =  kanjiList.map {.init(isFavoriteWord: favoriteWords.contains($0.kanji), kanjiInfo: $0)}
            self.selectedKanjiRow = selectedKanjiRow
        }
    }
    
    enum Action: Equatable {
        case onAppear
        case backBtnTapped
        case kanjiSelected(Int)
        case starBtnTapped(Int)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if let row = state.selectedKanjiRow, state.selectedKanjiDetailInfo == nil {
                    state.selectedKanjiDetailInfo =  kanjiManager.findKanjiDetail(by: state.kanjiList[row].kanjiInfo.kanji)
                }
                return .none
                
            case .kanjiSelected(let row):
                state.selectedKanjiRow = state.selectedKanjiRow == row ? nil : row
                state.selectedKanjiDetailInfo = state.selectedKanjiRow == nil ?  nil : kanjiManager.findKanjiDetail(by: state.kanjiList[state.selectedKanjiRow!].kanjiInfo.kanji)
                return .none
                
            case .starBtnTapped(let row):
                var tappedData = state.kanjiList[row]
                tappedData.isFavoriteWord.toggle()
                
                state.$favoriteWords.withLock { favorites in
                    if let index = favorites.firstIndex(of: tappedData.kanjiInfo.kanji) {
                        favorites.remove(at: index)
                    } else {
                        favorites.append(tappedData.kanjiInfo.kanji)
                        favorites = Array(favorites.prefix(100))
                    }
                }
                
                state.kanjiList[row] = tappedData
                return .none
                
            default: return .none
            }
        }
    }
}
