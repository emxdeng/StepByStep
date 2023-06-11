//
//  ContentView.swift
//  StepByStep
//
//  Created by Sunjun (Lucie) Kwak on 8/5/2023.
//

import SwiftUI
import LoadingButton

/**
 Define properties and details for a selected habit.
 */

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
    @State private var shouldShowHabitListView = false // transit to ShouldHabitListView
    @State var isLoading = false

    @StateObject var habitViewModel = HabitViewModel()
    @Binding var selectedGoal: String
    @Binding var selectedHabit: String
    @Binding var habitTextField: String

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


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
        NavigationView {
            VStack {
                ScrollView {

                    // Title of this screen
                    ContentTitleView()

                    Spacer().frame(height: 30)

                    // Code for choosing the goal the habit is part of
                    VStack {
                        Text("My goal")
                            .font(.system(size: 22))
                            .fontWeight(.regular)
                            .foregroundColor(CustomColor.textColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .alignmentGuide(.leading) { _ in 0 }

                        Spacer()

                        TextField("My goal", text: $selectedGoal)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(10)
                    }

                    Spacer().frame(height: 20)

                    // Set the due date of the goal
                    HabitDueDateView(hasDueDate: $hasDueDate, selectedDate: $selectedDate)


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

                    // Set weekly calendar for habit
                    HabitWeeklyCalendarView(selectedDays: $selectedDays, selectedHabitColor: $selectedHabitColor)

                    // Set time for habit
                    HabitTimeView(hasAlarmTime: $hasAlarmTime, selectedAlarmTime: $selectedAlarmTime)

                    // Set amount of time or number of times per day
                    HabitDurationView(hideTimePickers: $hideTimePickers, selectedHours: $selectedHours, selectedMinutes: $selectedMinutes)

                    // Code for 'save' button
                    LoadingButton(action: {
                        shouldShowHabitListView = true
                        let hexColor = selectedHabitColor?.toHex()
                        print("Selected habit color: \(String(describing: selectedHabitColor))")
                        print("Hex color: \(String(describing: hexColor))")
                        
                        habitViewModel.saveHabit(habitText, selectedHours, selectedMinutes, hexColor ?? "FAC088", selectedDate, !hasDueDate, selectedDays)

                        print("Text below are habit lists!!!!!!!")
                        print(habitViewModel.habits)

                        for habit in habitViewModel.habits {
                            if let habitText = habit.text {
                                print("Habit Text: \(habitText)")
                            }
                            if let habitColor = habit.color {
                                print("Habit Color: \(habitColor)")
                            }

                            print("Habit hours: \(habit.selectedHours)")
                            print("Habit minutes: \(habit.selectedMinutes)")
                            print("Due date: \(String(describing: habit.dueDate))")
                            print("Has due date: \(habit.hasDueDate)")
                            print("Days of week: \(String(describing: habit.daysOfWeek))")

                            // Print other habit data here
                        }


                        print("end line of habit lists&&&&")
                    }, isLoading: $isLoading) {
                        Text("Save")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                        .frame(width: 120, height: 40)
                        .background(CustomColor.habitColor5)
                        .clipShape(Rectangle())
                        .cornerRadius(4)
                }
            }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .padding(2)
                    Text("Back")
                }
            })
        }
            .onAppear() {
            if habitTextField == "" {
                habitText = selectedHabit
            } else {
                habitText = habitTextField
            }
        }

            .padding(10)

            .environmentObject(habitViewModel) // Pass the ViewModel to the environment
        .fullScreenCover(isPresented: $shouldShowHabitListView) { // Transition to the HomeScreenView
            ShowHabitListView()
                .environmentObject(habitViewModel)
//            HomeScreenView(habitText: $habitText, habits: $habitViewModel.habits, habitColor: selectedHabitColor) // Pass habit text and color to the HomeScreenView
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(selectedGoal: .constant("Be a morning person"), selectedHabit: .constant("test habit"), habitTextField: .constant(""))
                .environmentObject(HabitViewModel())
        }
    }

}

