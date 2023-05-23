//
//  ColorToStringManager.swift
//  StepByStep
//
//  Created by Emily Deng on 23/5/2023.
//

import Foundation
import SwiftUI

extension Color {
    func hexString() -> String? {
        guard let components = UIColor(self).cgColor.components else { return nil }
        
        let r = components[0]
        let g = components[1]
        let b = components[2]
        let a = components[3]
        
        let hexString = String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        return hexString
    }
}
