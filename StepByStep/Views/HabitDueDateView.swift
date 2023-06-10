//
//  HabitDueDateView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

struct HabitDueDateView: View {
    @Binding var hasDueDate: Bool
    @Binding var selectedDate: Date

    var body: some View {
        VStack {
            HStack {
                Text("Due date")
                    .font(.system(size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(hasDueDate ? CustomColor.gray : CustomColor.textColor)
                    .multilineTextAlignment(.leading)

                VStack(alignment: .leading) {
                    HStack {
                        Toggle(isOn: $hasDueDate) {
                            Text("")
                        }

                        Text("(No due date)")
                            .fontWeight(.regular)
                            .foregroundColor(hasDueDate ? CustomColor.gray : CustomColor.textColor)
                            .font(.system(size: 16))
                    }
                }
            }
            if hasDueDate {
                EmptyView()
            } else {
                DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: [.date], label: { Text("Date") })
                    .background(CustomColor.lightOrange)
            }
        }
    }
}
