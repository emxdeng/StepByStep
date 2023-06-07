//
//  HabitViewModel.swift
//  StepByStep
//
//  Created by Janet on 22/5/2023.
//

import SwiftUI
import CoreData

class HabitViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    private let persistenceController = PersistenceController.shared

    init() {
        fetchHabits()
    }
    
    func fetchHabits() {
        let request: NSFetchRequest<Habit> = Habit.fetchRequest()

        do {
            habits = try persistenceController.container.viewContext.fetch(request)
        } catch {
            print("Error fetching habits: \(error)")
        }
    }

    func saveHabit(_ habitText: String, _ selectedHours: Int, _ selectedMinutes: Int) {
        let context = persistenceController.container.viewContext
        let habit = Habit(context: context)
        habit.text = habitText
        habit.selectedHours = Int16(selectedHours)
        habit.selectedMinutes = Int16(selectedMinutes)

        habits.append(habit)
        persistenceController.save()
    }
    
}


// create a computed property that returns a formatted string combining the habit text and duration
extension Habit {
    // Computed property to combine habit text and duration
    var displayText: String {
        if let text = text {
            let duration = String(format: "%02d:%02d", selectedHours, selectedMinutes)
            return "\(text) - \(duration)"
        }
        return ""
    }
}
