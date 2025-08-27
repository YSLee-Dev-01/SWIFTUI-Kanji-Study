//
//  SearchFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/27/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SearchFeature: Reducer {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case backBtnTapped
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
    }
}
