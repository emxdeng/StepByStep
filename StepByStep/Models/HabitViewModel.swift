//
//  HabitViewModel.swift
//  StepByStep
//
//  Created by Janet on 22/5/2023.
//

import SwiftUI
import CoreData

/**
 CoreData CRUD functions
 */
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

    // Save habit
    func saveHabit(_ habitText: String, _ selectedHours: Int, _ selectedMinutes: Int, _ selectedColor: String, _ selectedDate: Date, _ hasDueDate: Bool, _ daysOfWeek: [String]) {
        let context = persistenceController.container.viewContext
        let habit = Habit(context: context)
        habit.text = habitText
        habit.selectedHours = Int16(selectedHours)
        habit.selectedMinutes = Int16(selectedMinutes)
        habit.color = selectedColor
        habit.dueDate = selectedDate
        habit.hasDueDate = hasDueDate

        // Default is all days of the week
        if (daysOfWeek.joined(separator: ";") == "") {
            habit.daysOfWeek = "Mon;Tue;Wed;Thu;Fri;Sat;Sun"
        } else {
            habit.daysOfWeek = daysOfWeek.joined(separator: ";")
        }

        habits.append(habit)
        persistenceController.save()
    }

    // Delete all habits
    func deleteAllHabits() {
        let context = persistenceController.container.viewContext

        do {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Habit.fetchRequest()
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            try context.execute(deleteRequest)
            try context.save()
            habits.removeAll()
        } catch {
            print("Error deleting habits: \(error)")
        }
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
