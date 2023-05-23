//
//  CoreDataManager.swift
//  StepByStep
//
//  Created by Emily Deng on 21/5/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "GoalDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store Failed \(error.localizedDescription)")
            }
        }
    }
    
    //save a new habit object
    func saveHabit(
        habitTitle: String,
        goal: String,
        color: String,
        creationDate: Date,
        timeOfDay: Date? = nil,
        dueDate: Date? = nil,
        daysOfWeek: String,
        howLongInMinutes: Int32 = 0,
        howManyTimesPerDay: Int32 = 1
    ) {
        
        let habit = Habit(context: persistentContainer.viewContext)
        
        habit.habit = habitTitle
        habit.goal = goal
        habit.color = color
        habit.creationDate = creationDate
        habit.timeOfDay = timeOfDay
        habit.dueDate = dueDate
        habit.daysOfWeek = daysOfWeek
        habit.howLongInMinutes = howLongInMinutes
        habit.howManyTimesPerDay = howManyTimesPerDay
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print ("Failed to save habit \(error)")
        }
        
    }
    
    //get an array of all habits
    func getAllHabits() -> [Habit] {
        
        let fetchRequest : NSFetchRequest<Habit> = Habit.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    //delete a habit
    func deleteHabit(habitToDelete: Habit) {
        
        persistentContainer.viewContext.delete(habitToDelete)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save context while deleting habit \(error)")
        }
        
    }
    
    //save the context
    func updateHabit() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
}
