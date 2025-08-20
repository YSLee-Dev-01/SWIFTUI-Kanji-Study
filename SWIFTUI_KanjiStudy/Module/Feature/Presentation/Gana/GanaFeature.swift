//
//  GanaFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct GanaFeature: Reducer {
    @Dependency(\.ganaManager) var ganaManager
    
    @ObservableState
    struct State: Equatable {
        let isHiragana: Bool
        var gana: [[String]] = []
        
        init(isHiragana: Bool) {
            self.isHiragana = isHiragana
        }
    }
    
    enum Action: Equatable {
        case onAppear
        case backBtnTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if state.gana.isEmpty {
                    state.gana = state.isHiragana ?  ganaManager.getGiragana() : ganaManager.getKatakana()
                }
                return .none
                
            default: return .none
            }
        }
    }
}
