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
        var recommendKanjiList: [[KanjiInfo]] = []
        @Shared(.favoriteWords) var favoriteWords: [String] = []
    }
    
    enum Action: Equatable {
        case kanaBtnTapped(kanaType: KanaType)
        case kanjiBtnTapped
        case favoriteWordTapped(Int)
        case searchBtnTapped
        case editBtnTapped
        case onAppear
        
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
                
            case .onAppear:
                var transformedData = [[KanjiInfo]]()
                let list = kanjiManager.recommendKanjiList(exceptionKanjiList: state.favoriteWords)
                
                for index in stride(from: 0, to: list.count, by: 5) {
                    transformedData.append(Array(list[index ..< min(index + 5, list.count)]))
                }
                state.recommendKanjiList = transformedData
                
                return .none
                
            default: return .none
            }
        }
    }
}
