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
    
    @EnvironmentObject var habitViewModel: HabitViewModel
    
    static let lightOrange = Color("LightOrange")
    
    var body: some View {
        NavigationView {
            ScrollView {
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
                    .navigationBarTitle("Habit List")

                }
            }
            .fullScreenCover(isPresented: $shouldShowContentView) {
                ContentView(selectedGoal: .constant("Be a morning person"))
            }
        }
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
        
        // Add settings button to delete all habits
        Button(action: {
            showDeleteConfirmationAlert = true
            //habitViewModel.deleteAllHabits()
        }, label: {
            Image("settings")
                .renderingMode(.original)
                .frame(width: 30, height: 30)
        })
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
