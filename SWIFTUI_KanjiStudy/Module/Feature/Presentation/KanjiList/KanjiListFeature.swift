//
//  KanjiListFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct KanjiListFeature: Reducer {
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
    }
}
