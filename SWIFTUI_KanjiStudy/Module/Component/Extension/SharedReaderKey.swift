//
//  SharedReaderKey.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/26/25.
//

import Foundation
import ComposableArchitecture

extension SharedReaderKey where Self == AppStorageKey<[String]> {
    static var favoriteWords: Self {
        appStorage("favoriteWords")
    }
}
