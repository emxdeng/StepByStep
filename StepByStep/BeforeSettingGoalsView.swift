//
//  BeforeSettingGoalsView.swift
//  StepByStep
//
//  Created by Janet on 10/5/2023.
//

import Foundation
import SwiftUI

struct BeforeSettingGoalsView: View {
    var body: some View {
        GeometryReader { geometry in
            // Create a vertical ScrollView to display the calendar and warning message
            ScrollView {
                VStack(spacing: 50) {
                    // Create a horizontal ScrollView to display the calendar
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            // Use ForEach to display 7 nearest dates
                            ForEach(0..<7) { index in
                                VStack {
                                    Text(String(Date().addingTimeInterval(TimeInterval(86400 * index)).dayOfMonth()))
                                        .font(.system(size: 30))
                                        .fontWeight(.bold)
                                        .foregroundColor(index == 0 ? .orange : .primary)
                                    Text(Date().addingTimeInterval(TimeInterval(86400 * index)).monthShort())
                                        .font(.system(size: 15))
                                        .foregroundColor(.secondary)
                                }
                                .frame(width: geometry.size.width / 7 - 20, height: 80)
                                .background(index == 0 ? Color.orange.opacity(0.3) : Color.gray.opacity(0.3))
                                .cornerRadius(10)
                            }

                            Spacer(minLength: 20)
                        }
                        .frame(width: geometry.size.width, height: 100)
                        .padding(.horizontal, 20)
                    }
                    
                    // Display the app icon image with specified size and aspect ratio
                    Image("warning 2@4x")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)

                    // Display text with custom font and color
                    Text("You haven't set any goals yet!\nTap the button below to get started.")
                        .font(Font.custom("TropicalAsianDEMO-Regular", size: 35))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                
                    // Display the button to add goals
                    Button(action: {
                        // Handle button tap action
                        print("Button tapped!")
                    }) {
                        Image("addGoalButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 180)
                    }

                    
                }
                .padding(.top, geometry.safeAreaInsets.top + 15.0) // Apply safe area insets
            }
        }
    }
}

// Extension to format Date as short date
extension Date {
    func shortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: self)
    }
    
    func dayOfMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }
    
    func monthShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
}
