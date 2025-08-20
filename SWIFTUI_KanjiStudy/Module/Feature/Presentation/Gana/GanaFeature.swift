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
        let kanaType: KanaType
        var ganaList: [[String]] = []
        var selectedGanaIndexPath: IndexPath? = nil
        
        init(kanaType: KanaType) {
            self.kanaType = kanaType
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
                if state.ganaList.isEmpty {
                    state.ganaList = state.kanaType == .hiragana ?  ganaManager.getGiragana() : ganaManager.getKatakana()
                }
                return .none
                
            default: return .none
            }
        }
    }
}
