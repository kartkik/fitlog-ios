//
//  HomeView.swift
//  fitlog
//
//  Created by 12345 on 22/11/2025.
//









import SwiftUI

struct HomeView: View {
    @Environment (\.managedObjectContext) var context
    @StateObject private var vm = HomeViewModel()
    var body: some View {

        NavigationStack{
            ZStack(alignment: .top){
                LinearGradient(colors: [AppThemes.primaryClr.opacity(0.9), AppThemes.secondaryClr, ], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack{
                    HeaderView()
                    
                    cardView
                    
                    listView
                      
                }
               
            }  .onAppear{
                vm.fetchWorkoutSession(context: context)
            }
        }
    }
    
    
    private var cardView: some View {
        VStack(spacing: 32) {   // spacing between title + first button
            Text("Ready to Start")
                .font(AppThemes.bold(25))
                .foregroundColor(AppThemes.textClr)

            VStack(spacing:20) {
                Button(action: {}) {
                    NavigationLink{
                        AddWorkoutView(context: context)
                        
                    }label: {
                        Text("Start New Workout")
                            .font(AppThemes.regular(20))
                            .padding(.vertical, 14)
                            .padding(.horizontal, 28)
                            .background(AppThemes.accentClr)
                            .foregroundColor(.black)
                            .clipShape(Capsule())
                    }
               
                }

                Button(action: {}) {
                    Text("Continue Last Workout")
                        .font(AppThemes.regular(15))
                        .padding(.vertical, 6)
                        .padding(.horizontal, 15)
                        .foregroundColor(AppThemes.textClr)
                        .overlay(
                            Capsule()
                                .stroke(AppThemes.textClr.opacity(0.4), lineWidth: 1.2)
                        )
                }
            }
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 24)
        .frame(maxWidth: 350)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(AppThemes.secondaryClr)
                .shadow(color:.black.opacity(0.06),radius: 6)
        )
    }
    
    
    private var listView: some View {
        VStack(alignment: .leading, spacing: 16) {

            // Section Title
            HStack {
                Text("Your Sessions")
                    .font(AppThemes.bold(20))
                    .foregroundColor(AppThemes.textClr)
                Spacer()
            }
            .padding(.horizontal)

            // Cards
            ForEach(vm.sessions) { workout in
                
                HStack(spacing: 18) {

                    // Random Icon Bubble
                    ZStack {
                        Circle()
                            .fill(AppThemes.secondaryClr.opacity(0.4))
                            .frame(width: 52, height: 52)

                        Image(systemName: vm.randomIcon())
                            .font(.system(size: 24, weight: .medium))
                            .foregroundColor(AppThemes.accentClr)
                    }

                    // Text info
                    VStack(alignment: .leading, spacing: 6) {

                        Text(workout.workoutName ?? "Untitled")
                            .font(AppThemes.bold(18))
                            .foregroundColor(AppThemes.textClr)

                        HStack(spacing: 6) {

                            Text("\(Int(workout.duration)) min")
                                .font(AppThemes.regular(14))
                                .foregroundColor(AppThemes.textClr.opacity(0.7))

                            // Accent dot separator
                            Circle()
                                .fill(AppThemes.accentClr)
                                .frame(width: 6, height: 6)

                            Text("\(workout.caloriesBurned ?? "") cal")
                                .font(AppThemes.regular(14))
                                .foregroundColor(AppThemes.textClr.opacity(0.7))
                        }
                    }


                    Spacer()
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 24)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(AppThemes.secondaryClr)
                        .shadow(color: .black.opacity(0.06), radius: 6)
                )
                .padding(.horizontal)
            }
        }
    }

    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


