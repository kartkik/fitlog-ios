//
//  AddWorkoutViewModel.swift
//  fitlog
//
//  Created by 12345 on 23/11/2025.
//

import Foundation
import CoreData


class AddWorkoutViewModel:ObservableObject{
    @Published var workoutName : String = ""
    @Published var durationMinutes: Int = 30
    @Published var calories: String = ""
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    let context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    func saveWorkout(){
        let newWorkout = WorkoutSession(context: context)
        
        newWorkout.id = UUID()
        newWorkout.caloriesBurned = calories
        newWorkout.duration = Int64(durationMinutes)
        newWorkout.time = Date()
        newWorkout.workoutName = workoutName
        
        do{
           try context.save()
            
        }catch{
            print("Error saving the workout log.")
        }
            
        
    }
}
