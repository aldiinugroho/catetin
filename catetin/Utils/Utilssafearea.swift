//
//  Utilssafearea.swift
//  catetin
//
//  Created by aldinugroho on 08/04/24.
//

import Foundation
import UIKit

class Utilssafearea {
    static func top() -> CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.top ?? 0.0
    }
    static func bottom() -> CGFloat {
        let window = UIApplication.shared.windows.first
        return window?.safeAreaInsets.bottom ?? 0.0
    }
}
