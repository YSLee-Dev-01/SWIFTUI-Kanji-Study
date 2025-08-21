//
//  KanjiManagerKey.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import Foundation
import ComposableArchitecture

struct KanjiManagerKey: DependencyKey {
    /// 서버, DB에 따라 값이 변경되지 않고 고정되어 있기 때문에 같은 Manager를 사용합니다.
    static let liveValue: KanjiManagerProtocol = KanjiManager.shared
    static let previewValue: KanjiManagerProtocol = KanjiManager.shared
    static let testValue: KanjiManagerProtocol = KanjiManager.shared
}
