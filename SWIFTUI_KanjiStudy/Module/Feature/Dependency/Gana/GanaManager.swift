//
//  GanaManager.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/19/25.
//

import Foundation

struct GanaManager: GanaManagerProtocol {
    
    // MARK: - Properties
    
    static var shared = GanaManager()
    
    // MARK: - LifeCycle
    
    private init() {}
    
    // MARK: - Methods
    
    func getGiragana() -> [[String]] {
        return [
                ["あ", "い", "う", "え", "お"],
                ["か", "き", "く", "け", "こ"],
                ["が", "ぎ", "ぐ", "げ", "ご"],
                ["さ", "し", "す", "せ", "そ"],
                ["た", "ち", "つ", "て", "と"],
                ["な", "に", "ぬ", "ね", "の"],
                ["は", "ひ", "ふ", "へ", "ほ"],
                ["ま", "み", "む", "め", "も"],
                ["や", "",  "ゆ", "", "よ"],
                ["ら", "り", "る", "れ", "ろ"],
                ["わ", "" , "を", "",  "ん"]
            ]
    }
    
    func getKatakana() -> [[String]] {
        return [
            ["ア", "イ", "ウ", "エ", "オ"],
            ["カ", "キ", "ク", "ケ", "コ"],
            ["サ", "シ", "ス", "セ", "ソ"],
            ["タ", "チ", "ツ", "テ", "ト"],
            ["ナ", "ニ", "ヌ", "ネ", "ノ"],
            ["ハ", "ヒ", "フ", "ヘ", "ホ"],
            ["マ", "ミ", "ム", "メ", "モ"],
            ["ヤ", "", "ユ", "", "ヨ"],
            ["ラ", "リ", "ル", "レ", "ロ"],
            ["ワ", "", "ヲ", "", "ン"]
        ]
    }
}
