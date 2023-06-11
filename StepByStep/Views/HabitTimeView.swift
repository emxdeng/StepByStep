//
//  HabitTimeView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

/**
 Select the time of day for the habit to apply to
 */

struct HabitTimeView: View {
    @Binding var hasAlarmTime: Bool
    @Binding var selectedAlarmTime: Date

    var body: some View {
        VStack {
            HStack {
                Text("At what time?")
                    .font(.system(size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(hasAlarmTime ? CustomColor.gray : CustomColor.textColor)
                    .multilineTextAlignment(.leading)

                VStack(alignment: .leading) {
                    HStack {
                        Toggle(isOn: $hasAlarmTime) {
                            Text("")
                        }

                        Text("(At any time of day)")
                            .fontWeight(.regular)
                            .foregroundColor(hasAlarmTime ? CustomColor.gray : CustomColor.textColor)
                            .font(.system(size: 16))
                    }
                }
            }
            if hasAlarmTime {
                EmptyView()
            } else {
                DatePicker(selection: $selectedAlarmTime, displayedComponents: [.hourAndMinute], label: { Text("") })
            }
        }
    }
}

