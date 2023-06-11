//
//  GetStartedView.swift
//  StepByStep
//
//  Created by Janet on 8/5/2023.
//

import Foundation
import SwiftUI

/**
 
 The initial get started screen for new users to StepByStep.
 
 */

struct GetStartedView: View {
    var body: some View {
        // Create a ZStack to place elements on top of each other
        ZStack {
            // Set the background color to a light beige color and ignore the safe area
            Color(UIColor(red: 0.99, green: 0.93, blue: 0.87, alpha: 1.0)).edgesIgnoringSafeArea(.all)
            
            // Create a VStack to vertically stack the elements
            VStack(spacing: 30) {
                // Create empty space between the two text elements
                Spacer()
                // Display a greeting text with custom font and color
                Text("Hi There!\n\nLET'S HELP YOU GET STARTED")
                    .font(Font.custom("TropicalAsianDEMO-Regular", size: 45))
                    .foregroundColor(Color(red: 0.94, green: 0.52, blue: 0.38))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                Spacer()
            }
            // Add vertical padding to the VStack
            .padding(.vertical, 30.0)
        }
    }
}

