//
//  AddWorkoutView.swift
//  fitlog
//
//  Created by 12345 on 23/11/2025.
//

import Foundation
import SwiftUI
import CoreData

struct AddWorkoutView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel: AddWorkoutViewModel

    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: AddWorkoutViewModel(context: context))
    }
    var body: some View {
        ZStack {
            AppThemes.primaryClr.ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    Button {
                           dismiss()
                       } label: {
                           ZStack {
                               Circle()
                                   .fill(AppThemes.secondaryClr.opacity(0.6))
                                   .frame(width: 36, height: 36)

                               Image(systemName: "chevron.left")
                                   .font(.system(size: 17, weight: .semibold))
                                   .foregroundColor(AppThemes.accentClr)
                           }
                       }
                  
                    // HEADER
                    Text("Add Workout")
                        .font(AppThemes.bold(30))
                        .foregroundColor(AppThemes.textClr)
                    
                    // FORM CARD
                    VStack(spacing: 40) {
                        
                        // Workout name
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Workout Name")
                                .font(AppThemes.medium(16))
                                .foregroundColor(AppThemes.textClr.opacity(0.8))
                            
                            TextField("e.g. Morning Run", text: $viewModel.workoutName)
                                .padding()
                                .background(AppThemes.secondaryClr)
                                .cornerRadius(14)
                                .font(AppThemes.medium(18))
                                .foregroundColor(AppThemes.textClr)
                        }
                        
                        // Duration Picker
                        VStack(alignment: .center, spacing: 30) {
                            Text("Duration")
                                .font(AppThemes.medium(16))
                                .foregroundColor(AppThemes.textClr.opacity(0.8))
                            
                            CircularDurationPicker(minutes: $viewModel.durationMinutes)
                                .frame(height: 200)
                                .padding(.top, 10)
                        }.padding(.horizontal, 70)
                        
                        // Calories
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Calories Burned")
                                .font(AppThemes.medium(16))
                                .foregroundColor(AppThemes.textClr.opacity(0.8))
                            
                            TextField("e.g. 200", text: $viewModel.calories)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(AppThemes.secondaryClr)
                                .cornerRadius(14)
                                .font(AppThemes.medium(18))
                                .foregroundColor(AppThemes.textClr)
                        }
                    }
                    .padding()
                    .background(AppThemes.secondaryClr.opacity(0.35))
                    .cornerRadius(22)
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
                    
                    // SAVE BUTTON
                    Button {
                         viewModel.saveWorkout()
                        dismiss()
                    } label: {
                        Text("Save Workout")
                            .font(AppThemes.bold(20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [AppThemes.accentClr.opacity(0.9),
                                             AppThemes.accentClr],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(18)
                            .shadow(color: AppThemes.accentClr.opacity(0.3), radius: 8, y: 4)
                    }
                    .padding(.top, 10)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
        }.navigationBarHidden(true)

    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        AddWorkoutView(context: context)
    }
}
