//
//  SessionModel.swift
//  fitlog
//
//  Created by 12345 on 23/11/2025.
//

import Foundation


struct SessionModel : Identifiable{
    let id: UUID
    let workoutName : String
    let durationMinuted : String
    
    
    init(id: UUID, workoutName: String,  durationMinuted: String) {
        self.id = id
        self.workoutName = workoutName
        self.durationMinuted = durationMinuted
    }
    
}
