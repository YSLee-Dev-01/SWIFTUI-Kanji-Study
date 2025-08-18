//
//  NavigationView+.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import UIKit

extension UINavigationController: UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }
}
