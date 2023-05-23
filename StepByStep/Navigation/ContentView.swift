//
//  ContentView.swift
//  StepByStep
//
//  Created by Sunjun (Lucie) Kwak on 8/5/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var hasDueDate = true
    @State private var selectedDate = Date()
    @State private var habitText = "" // pass habit text to the HomeScreenView
    @State private var selectedHabitColor: Color? = nil
    @State private var selectedDays: [String] = []
    @State private var hasAlarmTime = true
    @State private var selectedAlarmTime = Date()
    @State private var selectedHours = 0
    @State private var selectedMinutes = 0
    @State private var hideTimePickers = false
    @State private var shouldShowHomeScreenView = false // transit to HomeScreenView
    
    @StateObject var habitViewModel = HabitViewModel()
    
    @Binding var selectedGoal: String
    
    // Colors for habit color palette
    let habitColors: [Color] = [
        CustomColor.habitColor1, CustomColor.habitColor2, CustomColor.habitColor3,
        CustomColor.habitColor4, CustomColor.habitColor5, CustomColor.habitColor6,
        CustomColor.habitColor7, CustomColor.habitColor8, CustomColor.habitColor9,
        CustomColor.habitColor10, CustomColor.habitColor11, CustomColor.habitColor12,
        CustomColor.habitColor13, CustomColor.habitColor14, CustomColor.habitColor15,
        CustomColor.habitColor16, CustomColor.habitColor17, CustomColor.habitColor18,
        CustomColor.habitColor19, CustomColor.habitColor20, CustomColor.habitColor21,
        CustomColor.habitColor22, CustomColor.habitColor23, CustomColor.habitColor24,
        CustomColor.habitColor25
    ]
    

    var body: some View {
        ScrollView {
        // Code for title of this screen
        Text("Now let's set the specifics of\nyour goal and habit :)")
                .font(.system(size: 24))
                .fontWeight(.bold)
            .foregroundColor(CustomColor.textColor)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
        
        // Code for choosing the goal the habit is part of
        VStack {
            Text("My goal")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .alignmentGuide(.leading) { _ in 0 }
            
            TextField("My goal", text: $selectedGoal)
                .font(.system(size: 18))
                .foregroundColor(.white)
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
        }
        
        // Code for setting the due date of the goal
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
                DatePicker(selection: $selectedDate, displayedComponents: [.date], label: { Text("Date") })
                    .background(CustomColor.lightOrange)
            }
        }
        
        // Code for 'helpful habit' that the user will input
        VStack {
            Section(header: Text("Helpful habit")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            ) {
                TextField("Write your habit here...", text: $habitText)
                    .background(selectedHabitColor)
                    .foregroundColor(selectedHabitColor != nil ? .white : CustomColor.textColor)
            }
    
            // Code for habit color palette
            Section(header: Text("Habit colour")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            ) {
                VStack {
                        ForEach(0..<5) { row in
                            HStack {
                                ForEach(0..<5) { column in
                                    let index = row * 5 + column
                                    HabitColorButton(color: habitColors[index]) {
                                        selectedHabitColor = habitColors[index]
                                    }
                                }
                            }
                        }
                    }
            }
            

        }
        
        // Code for weekly calendar
        VStack {
            Text("How often?")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .alignmentGuide(.leading) { _ in 0 }
            WeekdayPicker(selectedDays: $selectedDays, selectedHabitColor: $selectedHabitColor)
        }
        
        // Code for setting time
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
        
        // Code for setting amount of time or number of times per day
            VStack {
                Text("For how long?")
                    .font(.system(size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .padding(.top) // Reduce top padding
                
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
                    .padding(.bottom) // Reduce bottom padding
                }
                
                Toggle(isOn: $hideTimePickers) {
                    Text("(Don't set this)")
                }
                .padding(.top)
            }
        
            // Code for 'save' button
            Button(action: {
                // Action to perform when the button is tapped
                shouldShowHomeScreenView = true
                habitViewModel.saveHabit(habitText) // Save the habit text to the ViewModel
                print(habitViewModel.habits) // Print the habits array
            }) {
                Text("Save")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width: 120, height: 40)
            .background(CustomColor.habitColor5)
            .clipShape(Rectangle())
            .cornerRadius(4)
    }
        .environmentObject(habitViewModel) // Pass the ViewModel to the environment
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $shouldShowHomeScreenView) { // Transition to the HomeScreenView
            HomeScreenView(habitText: $habitText, habits: $habitViewModel.habits, habitColor: selectedHabitColor) // Pass habit text and color to the HomeScreenView
        }
}
        
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView(selectedGoal: .constant("Be a morning person"))
            }
        }
    }

