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
    @ObservableState
    struct State: Equatable {
        @Shared(.favoriteWords) var favoriteWords: [String] = []
    }
    
    enum Action: Equatable {
        case kanaBtnTapped(kanaType: KanaType)
        case kanjiBtnTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
    }
}
