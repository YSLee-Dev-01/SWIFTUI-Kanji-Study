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
        var path = StackState<Path.State>()
    }
    
    enum Action: Equatable {
        case homeAction(HomeFeature.Action)
        case path(StackAction<Path.State, Path.Action>)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.homeFeature, action: \.homeAction) {
            HomeFeature()
        }
        
        Reduce { state, action in
            switch action {
            case .homeAction(.kanaBtnTapped(let kanaType)):
                state.path.append(.kanaState(.init(kanaType: kanaType)))
                return .none
                
            case .path(.element(id: _, action: .kanaAction(.backBtnTapped))), .path(.element(id: _, action: .kanjiListAction(.backBtnTapped))):
                state.path.removeLast()
                return .none
                
            case .homeAction(.kanjiBtnTapped):
                state.path.append(.kanjiListState(.init()))
                return .none
                
            default: return .none
            }
        }
        .forEach(\.path, action: \.path) {
            Path()
        }
    }
}

extension AppFeature {
    @Reducer
    struct Path: Reducer {
        @ObservableState
        enum State: Equatable {
            case kanaState(KanaFeature.State)
            case kanjiListState(KanjiListFeature.State)
        }
        
        enum Action: Equatable {
            case kanaAction(KanaFeature.Action)
            case kanjiListAction(KanjiListFeature.Action)
        }
        
        var body: some Reducer<State, Action> {
            Scope(state: \.kanaState, action: \.kanaAction) {
                KanaFeature()
            }
            
            Scope(state: \.kanjiListState, action: \.kanjiListAction) {
                KanjiListFeature()
            }
        }
    }
}
