//
//  BeforeSettingGoalsView.swift
//  StepByStep
//
//  Created by Janet on 10/5/2023.
//

import Foundation
import SwiftUI

struct BeforeSettingBigGoalsView: View {
    @State private var selectedIndex: Int?
    
    var body: some View {
        GeometryReader { geometry in
            // Create a vertical ScrollView to display the calendar and warning message
            ScrollView {
                VStack(spacing: 50) {
                    // Create a horizontal ScrollView to display the calendar
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 20) {
                            ForEach(0..<90) { index in
                                VStack {
                                    Text(String(Date().addingTimeInterval(TimeInterval(86400 * index - 86400*89)).dayOfMonth()))
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(index == 89 ? .orange : .gray)
                                    Text(Date().addingTimeInterval(TimeInterval(86400 * index - 86400*89)).monthShort())
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: UIScreen.main.bounds.width / 7 - 10, height: 60)
                                .background(selectedIndex == index ? Color.orange : Color.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                .onTapGesture {
                                    selectedIndex = index
                                }
                            }
                            
                            Spacer().frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                    }

                    
                    // Display the app icon image with specified size and aspect ratio
                    Image("warning 2@4x")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)

                    // Display text with custom font and color
                    Text("You haven't set any goals yet!\nTap the button below to get started.")
                        //.font(Font.custom("TropicalAsianDEMO-Regular", size: 35))
                        .font(.system(size: 25))
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
