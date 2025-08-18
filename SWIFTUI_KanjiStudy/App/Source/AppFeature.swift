//
//  AppFeature.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AppFeature: Reducer {
    @ObservableState
    struct State: Equatable {
        var homeFeature: HomeFeature.State
    }
    
    enum Action: Equatable {
        case homeAction(HomeFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.homeFeature, action: \.homeAction) {
            HomeFeature()
        }
        
        Reduce { state, action in
            switch action {
            default: return .none
            }
        }
    }
}
