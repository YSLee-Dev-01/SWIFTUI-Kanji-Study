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

extension Shared where Value == Array<String> {
    mutating func toggleFavoriteWord(_ word: String) {
        withLock { list in
            if let firstIndex = list.firstIndex(of: word) {
                list.remove(at: firstIndex)
            } else {
                list = Array([word] + list.prefix(100))
            }
        }
    }
}
