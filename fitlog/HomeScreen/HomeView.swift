//
//  HomeView.swift
//  fitlog
//
//  Created by 12345 on 22/11/2025.
//









import SwiftUI

struct HomeView: View {
    var body: some View {

        NavigationStack{
            ZStack{
                LinearGradient(colors: [AppThemes.primaryClr.opacity(0.9), AppThemes.secondaryClr, ], startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack{
                    HeaderView()
                    
                    cardView
                    
                    listView
                }
               
            }
        }
    }
    
    
    private var cardView: some View {
        VStack(spacing: 32) {   // spacing between title + first button
            Text("Ready to Start")
                .font(AppThemes.bold(25))
                .foregroundColor(AppThemes.textClr)

            VStack(spacing:20) {   // tighter spacing between buttons

                // Start New Workout (Primary)
                Button(action: {}) {
                    Text("Start New Workout")
                        .font(AppThemes.regular(20))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 28)
                        .background(AppThemes.accentClr)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }

                // Continue Last Workout (Secondary)
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
    
    
    private var listView : some View{
        VStack{
            HStack{
                Text("Your Sessions")
                    .font(AppThemes.bold(20))
                    .foregroundColor(AppThemes.textClr)
                Spacer()
            }.padding()
            
            VStack{
                HStack{
                    Image(systemName: "running")
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }      .padding(.vertical, 30)
                    .padding(.horizontal, 24)
                    .frame(maxWidth: 350)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(AppThemes.secondaryClr)
                            .shadow(color:.black.opacity(0.06),radius: 6)
                    )
            }
           
        }
    }

    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
