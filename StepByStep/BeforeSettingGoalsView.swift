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
        // Create a ZStack to place elements on top of each other
        ZStack(alignment: .top) {
            // Create a VStack to vertically stack the elements
            VStack(spacing: 20) {
                // Display the app icon image with specified size and aspect ratio
                Image("warning@4x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                // Display text with custom font and color
                Text("You haven't set any goals yet!")
                    .font(Font.custom("TropicalAsianDEMO-Regular", size: 35))
                    .foregroundColor(.black)
                
                // Display text with custom font and color
                Text("Tap the button below to get started.")
                    .font(Font.custom("TropicalAsianDEMO-Regular", size: 35))
                    .foregroundColor(.black)
            }
            // Add vertical padding to the VStack
            .padding(.vertical, 30.0)
            
            // Create a horizontal ScrollView to display the calendar
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    // Use ForEach to display 7 nearest dates
                    ForEach(0..<7) { index in
                        VStack {
                            Text(String(Date().addingTimeInterval(TimeInterval(86400 * index)).dayOfMonth()))
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                            Text(Date().addingTimeInterval(TimeInterval(86400 * index)).monthShort())
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                        }
                        .frame(width: UIScreen.main.bounds.width / 7 - 20, height: 80)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                    }
                    
                    Spacer()
                        .frame(width: 20)
                }
                .frame(width: UIScreen.main.bounds.width, height: 100)
                .padding(.horizontal, 20)
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
