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

    func saveHabit(_ habitText: String) {
        let context = persistenceController.container.viewContext
        let habit = Habit(context: context)
        habit.text = habitText

        habits.append(habit)
        persistenceController.save()
    }
    
}

