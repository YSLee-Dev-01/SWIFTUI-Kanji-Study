//
//  DependencyValues+.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/19/25.
//

import Foundation
import ComposableArchitecture

extension DependencyValues {
    var ganaManager: KanaManagerProtocol {
        get {self[KanaManagerKey.self]}
        set {self[KanaManagerKey.self] = newValue}
    }
}
