//
//  HabitWeeklyCalendarView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

/**
 Select the end date for the habit
 */

struct HabitWeeklyCalendarView: View {
    @Binding var selectedDays: [String]
    @Binding var selectedHabitColor: Color?

    var body: some View {
        Text("How often?")
            .font(.system(size: 22))
            .fontWeight(.regular)
            .foregroundColor(CustomColor.textColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .alignmentGuide(.leading) { _ in 0 }
        WeekdayPicker(selectedDays: $selectedDays, selectedHabitColor: $selectedHabitColor)
    }
}

