//
//  HomeFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeFeature: Reducer {
    @Dependency(\.kanjiManager) private var kanjiManager
    
    @ObservableState
    struct State: Equatable {
        var isEditMode = false
        @Shared(.favoriteWords) var favoriteWords: [String] = []
    }
    
    enum Action: Equatable {
        case kanaBtnTapped(kanaType: KanaType)
        case kanjiBtnTapped
        case favoriteWordTapped(Int)
        case searchBtnTapped
        case editBtnTapped
        
        case delegate(Delegate)
    }
    
    enum Delegate: Equatable {
        case navigateToKanjiDetail(kanjiList: [KanjiInfo], jlptLevel: String, row: Int?)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .favoriteWordTapped(let row):
                let tappedData = state.favoriteWords[row]
                
                if state.isEditMode {
                    state.$favoriteWords.toggleFavoriteWord(tappedData)
                    if state.favoriteWords.isEmpty {
                        state.isEditMode = false
                    }
                    return .none
                } else {
                    guard let detailData = kanjiManager.findKanjiGroup(by: tappedData) else {return .none}
                    return .send(.delegate(.navigateToKanjiDetail(kanjiList: detailData.kanjiList, jlptLevel: detailData.jlptLevel, row: detailData.row)))
                }
                
            case .editBtnTapped:
                state.isEditMode.toggle()
                return .none
                
            default: return .none
            }
        }
    }
}
