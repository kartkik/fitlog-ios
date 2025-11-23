//
//  HomeViewModel.swift
//  fitlog
//
//  Created by 12345 on 23/11/2025.
//

import Foundation
import CoreData

class HomeViewModel : ObservableObject{
    
    @Published var sessions: [WorkoutSession] = []

    
    
    
    
    
    
    
    
    
    
    
    let workoutIcons = [
        "figure.walk",
        "figure.run",
        "figure.strengthtraining.traditional",
        "bicycle",
        "flame.fill",
        "bolt.fill",
        "heart.fill",
        "figure.cooldown"
    ]

    
    
    func randomIcon() -> String {
        workoutIcons.randomElement() ?? "figure.walk"
    }

    
    func fetchWorkoutSession(context: NSManagedObjectContext){
        let fetchReq = NSFetchRequest<WorkoutSession>(entityName: "WorkoutSession")
        fetchReq.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
        
        do{
            sessions = try context.fetch(fetchReq)
        }catch{
            print("Couldn't fetch")
        }
        
    }
    
    
}
