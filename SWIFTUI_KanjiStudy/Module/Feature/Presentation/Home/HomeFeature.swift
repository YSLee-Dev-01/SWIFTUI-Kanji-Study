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
        @Shared(.favoriteWords) var favoriteWords: [String] = []
    }
    
    enum Action: Equatable {
        case kanaBtnTapped(kanaType: KanaType)
        case kanjiBtnTapped
        case favoriteWordTapped(Int)
        case delegate(Delegate)
    }
    
    enum Delegate: Equatable {
        case navigateToKanjiDetail(kanjiList: [KanjiInfo], jlptLevel: String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .favoriteWordTapped(let row):
                let tappedData = state.favoriteWords[row]
                guard let detailData = kanjiManager.findKanjiGroup(by: tappedData) else {return .none}
                return .send(.delegate(.navigateToKanjiDetail(kanjiList: detailData.kanjiList, jlptLevel: detailData.jlptLevel)))
                
            default: return .none
            }
        }
    }
}
