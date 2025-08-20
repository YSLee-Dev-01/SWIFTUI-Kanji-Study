//
//  KanaFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct KanaFeature: Reducer {
    @Dependency(\.ganaManager) var ganaManager
    
    @ObservableState
    struct State: Equatable {
        let kanaType: KanaType
        var kanaList: [[String]] = []
        var selectedKanaIndexPath: IndexPath? = nil
        var selectedKanaInfo: KanaInfo? = nil
        
        init(kanaType: KanaType) {
            self.kanaType = kanaType
        }
    }
    
    enum Action: Equatable {
        case onAppear
        case backBtnTapped
        case ganaSelected(IndexPath)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                if state.kanaList.isEmpty {
                    state.kanaList = state.kanaType == .hiragana ?  ganaManager.getHiragana() : ganaManager.getKatakana()
                }
                return .none
                
            case .ganaSelected(let indexPath):
                state.selectedKanaIndexPath = indexPath
                return .none
                
            default: return .none
            }
        }
    }
}
