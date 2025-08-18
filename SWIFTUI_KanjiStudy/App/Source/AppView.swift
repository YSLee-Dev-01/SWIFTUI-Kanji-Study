//
//  AppView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @State private  var store: StoreOf<AppFeature>
    
    init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    
    var body: some View {
        NavigationStack(path: self.$store.scope(state: \.path, action: \.path), root: {
            HomeView(store: self.store.scope(state: \.homeFeature, action: \.homeAction))
        }) { store in
            Group {
                switch store.state {
                case .ganaState:
                    if let store = store.scope(state: \.ganaState, action: \.ganaAction) {
                        GanaView(store: store)
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AppView(store: .init(initialState: .init(homeFeature: .init()), reducer: {AppFeature()}))
}
