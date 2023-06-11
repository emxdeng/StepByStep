//
//  ShowHabitListView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

/**
 Homepage view once 1 or more habits are added.
 */

struct ShowHabitListView: View {
    @State private var shouldShowContentView = false // Transit to ContentView
    @State private var showDeleteConfirmationAlert = false // Show the pop-up window
    @State private var selectedIndex: Int?
    @State private var selectedDate: Date = Date() // Initialize selectedDate to the current date
    @EnvironmentObject var habitViewModel: HabitViewModel

    static let lightOrange = Color("LightOrange")

    init() {
        _selectedDate = State(initialValue: Date())
    }

    var body: some View {
        NavigationView {
            
            //Display horizontal scroll of dates
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(-180...180, id: \.self) { index in
                            VStack {
                                Text(getCurrentDayOfWeek(selectedDate: Date().addingTimeInterval(TimeInterval(86400 * index))))
                                                    .font(.system(size: 12))
                                                    .foregroundColor(.gray)
                                Text(String(Date().addingTimeInterval(TimeInterval(86400 * index)).dayOfMonth()))
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(index == 0 ? .orange : .gray)
                                Text(Date().addingTimeInterval(TimeInterval(86400 * index)).monthShort())
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                            }
                                .frame(width: UIScreen.main.bounds.width / 7 - 10, height: 80)
                                .background(selectedIndex == index + 5 ? Color.orange : Color.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                .onTapGesture {
                                selectedIndex = index + 5
                                selectedDate = Date().addingTimeInterval(TimeInterval(86400 * index))
                            }
                        }

                        Spacer().frame(width: 100)
                    }
                        .frame(width: UIScreen.main.bounds.width + CGFloat(1000 * 20), height: 100)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                }

                // Display habits associated with selected date
                VStack(spacing: 10) {
                    ForEach(habitViewModel.habits, id: \.self) { habit in
                        if let habitText = habit.text {
                            if shouldHabitDisplay(currentDayOfWeek: getCurrentDayOfWeek(selectedDate: selectedDate), daysOfWeek: habit.daysOfWeek ?? "Mon;Tue;Wed;Thu;Fri;Sat;Sun") {
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(colorFromHex(habit.color ?? "FAC088"))
                                        VStack(spacing: 4) {
                                            Text(habitText)
                                                .frame(maxWidth: .infinity)
                                                .font(.headline)
                                            Text("\(habit.selectedHours) hours \(habit.selectedMinutes) minutes")
                                                .foregroundColor(.white)

                                            if let dueDate = habit.dueDate {
                                                let userFriendlyDate = userFriendlyDate(date: dueDate)
                                                if habit.hasDueDate == true {
                                                    Text("Due Date: \(userFriendlyDate)")
                                                }
                                            } else {
                                                Text("")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                        .padding()
                }
            }
                .fullScreenCover(isPresented: $shouldShowContentView) {
                ContentView(selectedGoal: .constant("Be a morning person"), selectedHabit: .constant("Test habit"), habitTextField: .constant("Test free text"))
            }
                //Icons at top right of screen - statistics and delete all habits
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showDeleteConfirmationAlert = true
                    }) {
                        Image("settings")
                            .renderingMode(.original)
                            .frame(width: 30, height: 30)
                    }
                        .alert(isPresented: $showDeleteConfirmationAlert) {
                        Alert(
                            title: Text("Warning"),
                            message: Text("Are you sure you want to delete all habits?"),
                            primaryButton: .destructive(Text("Yes")) {
                                habitViewModel.deleteAllHabits()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
            }
                .navigationBarTitle("Habit List")
        }
            .navigationBarHidden(true)

        // Display the button to add goals
        Button(action: {
            // Transition to shouldShowContentView
            shouldShowContentView = true
        }) {
            Image("addGoalButton")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        }
    }
}

// Returns the color from a hex code string
func colorFromHex(_ hex: String) -> Color? {
    var formattedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if formattedHex.hasPrefix("#") {
        formattedHex.remove(at: formattedHex.startIndex)
    }

    if formattedHex.count != 6 {
        return nil
    }

    var rgbValue: UInt64 = 0
    Scanner(string: formattedHex).scanHexInt64(&rgbValue)

    let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
    let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
    let b = Double(rgbValue & 0x0000FF) / 255.0

    return Color(red: r, green: g, blue: b)
}

// Function to convert date to a user-friendly format
func userFriendlyDate(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy"
    return formatter.string(from: date)
}

// Function to determine whether a habit should display based on day of the week
func shouldHabitDisplay(currentDayOfWeek: String, daysOfWeek: String) -> Bool {
    if daysOfWeek.contains(currentDayOfWeek) {
        return true
    } else {
        return false
    }
}

// Returns formatted day of the week
func getCurrentDayOfWeek(selectedDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "E" // 'E' represents the abbreviated day of the week

    return dateFormatter.string(from: selectedDate)
}
