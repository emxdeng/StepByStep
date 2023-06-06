//
//  ShowHabitListView.swift
//  StepByStep
//
//  Created by Janet on 6/6/2023.
//

import Foundation
import SwiftUI

struct ShowHabitListView: View {
    
    @State private var shouldShowContentView = false // Transit to ContentView
    
    var body: some View {
        NavigationView {
            ScrollView { // Wrap the entire content in a ScrollView
                VStack {
                    Text("Habits list")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    Button(action: {
                        shouldShowContentView = true
                    }) {
                        Text("Return")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
                    .padding()
                    .frame(maxWidth: .infinity) // Make the button width match the screen width
                }
                .padding()
                .frame(maxWidth: .infinity) // Make the VStack width match the screen width
            }
        }
        .edgesIgnoringSafeArea(.all) // Extend content to the edges of the screen
        .fullScreenCover(isPresented: $shouldShowContentView) {
            ContentView(selectedGoal: .constant("Be a morning person"))
        }
    }
}


