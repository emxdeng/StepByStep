//
//  WeekdayPicker.swift
//  StepByStep
//
//  Created by Janet on 23/5/2023.
//

import Foundation
import SwiftUI

/**
 Select which weekdays the habit should apply to.
 */

struct WeekdayPicker: View {
    @Binding var selectedDays: [String]
    @Binding var selectedHabitColor: Color?
    
    let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(weekdays, id: \.self) { weekday in
                Button(action: {
                    if selectedDays.contains(weekday) {
                        selectedDays.removeAll { $0 == weekday }
                    } else {
                        selectedDays.append(weekday)
                    }
                }) {
                    Text(weekday)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 20, leading: 8, bottom: 20, trailing: 8))
                        .foregroundColor(selectedDays.contains(weekday) ? .white : .black)
                        .background(selectedDays.contains(weekday) ? (selectedHabitColor ?? Color.blue) : Color.clear)
                        .cornerRadius(8)
                        .fixedSize()
                }
            }
        }
    }
}
