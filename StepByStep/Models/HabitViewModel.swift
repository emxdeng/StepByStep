//
//  HabitViewModel.swift
//  StepByStep
//
//  Created by Janet on 22/5/2023.
//

import Foundation
import SwiftUI

class HabitViewModel: ObservableObject {
    @Published var habits: [String] = [] {
        didSet {
            saveHabits() // Save habits whenever the array is updated
        }
    }

    init() {
        loadHabits() // Load habits when initializing the ViewModel
    }

    private func saveHabits() {
        UserDefaults.standard.set(habits, forKey: "HabitsKey") // Save habits to UserDefaults
    }

    private func loadHabits() {
        if let savedHabits = UserDefaults.standard.array(forKey: "HabitsKey") as? [String] {
            habits = savedHabits // Load habits from UserDefaults
        }
    }

    func saveHabit(_ habitText: String) {
        habits.append(habitText)
        print(habits)
    }
}


