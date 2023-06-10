//
//  ShowHabitListView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

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
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(-180...180, id: \.self) { index in
                            VStack {
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

                // show habit lists
                VStack(spacing: 10) {
                    ForEach(habitViewModel.habits, id: \.self) { habit in
                        if let habitText = habit.text {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(ShowHabitListView.lightOrange)
                                    VStack(spacing: 4){
                                        Text(habitText)
                                            .frame(maxWidth: .infinity)
                                            .font(.headline)
                                        Text("\(habit.selectedHours) hours \(habit.selectedMinutes) minutes")
                                            .foregroundColor(.gray)
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
