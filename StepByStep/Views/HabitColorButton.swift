//
//  HabitColorButton.swift
//  StepByStep
//
//  Created by Janet on 23/5/2023.
//

import Foundation
import SwiftUI

/**
 Style for habit color button
 */

struct HabitColorButton: View {
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(color)
        }
    }
}
