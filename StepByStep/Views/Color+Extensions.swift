//
//  Color+Extensions.swift
//  StepByStep
//
//  Created by Emily Deng on 10/6/2023.
//

import Foundation
import SwiftUI

extension Color {
    
    /**
       Converts the color to its hexadecimal representation.
       
       - Returns: The hexadecimal representation of the color, or `nil` if the conversion fails.
       */
    
    func toHex() -> String? {
        guard let components = UIColor(self).cgColor.components else { return nil }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        
        let hexString = String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        
        return hexString
    }
}



