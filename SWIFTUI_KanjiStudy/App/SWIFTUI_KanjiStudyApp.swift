//
//  SWIFTUI_KanjiStudyApp.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

@main
struct SWIFTUI_KanjiStudyApp: App {
    private let store: StoreOf<AppFeature> = .init(initialState: .init(), reducer: {AppFeature()})
    
    var body: some Scene {
        WindowGroup {
            AppView(store: self.store)
        }
    }
}
