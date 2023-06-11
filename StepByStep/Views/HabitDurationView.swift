//
//  HabitDurationView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

/**
 Select how long user works on the habit each day
 */

struct HabitDurationView: View {
    @Binding var hideTimePickers: Bool
    @Binding var selectedHours: Int
    @Binding var selectedMinutes: Int

    var body: some View {
        VStack {
            Text("For how long?")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(.black)
                .padding(.top)

            if !hideTimePickers {
                HStack {
                    Picker("Hours", selection: $selectedHours) {
                        ForEach(0..<4) { hour in
                            Text("\(hour) hrs")
                                .tag(hour)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)

                    Picker("Minutes", selection: $selectedMinutes) {
                        ForEach(0..<12) { minute in
                            let minuteInterval = minute * 5
                            Text("\(minuteInterval) mins")
                                .tag(minuteInterval)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100)
                }
                .padding(.bottom)
            }

            Toggle(isOn: $hideTimePickers) {
                Text("Set duration later")
            }
            .padding(.top)
        }
    }
}

