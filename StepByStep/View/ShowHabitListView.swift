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
    @EnvironmentObject var habitViewModel: HabitViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(habitViewModel.habits, id: \.self) { habit in
                        if let habitText = habit.text {
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color.orange.opacity(0.2))
                                .frame(maxWidth: .infinity, minHeight: 80)
                                .overlay(
                                    Text(habitText)
                                        .font(.title)
                                        .foregroundColor(.black)
                                        .padding()
                                )
                        }
                    }
                }
                .padding()
                .navigationBarTitle("Habit List")
                
                Button(action: {
                    shouldShowContentView = true
                }) {
                    Text("Return")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(10)
                .padding()
                .frame(maxWidth: .infinity) // Make the button width match the screen width
            }
        }
        .edgesIgnoringSafeArea(.all) // Extend content to the edges of the screen
        .fullScreenCover(isPresented: $shouldShowContentView) {
            ContentView(selectedGoal: .constant("Be a morning person"))
        }
    }
}
