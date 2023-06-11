//
//  AppLogoView.swift
//  StepByStep
//
//  Created by Janet on 8/5/2023.
//

import SwiftUI

/**
 
 The loading screen when initially opening StepByStep.
 
 */

struct AppLogoView: View {
    var body: some View {
        // Create a ZStack to place elements on top of each other
        ZStack {
            // Set the background color to a light beige color and ignore the safe area
            Color(UIColor(red: 0.99, green: 0.93, blue: 0.87, alpha: 1.0)).edgesIgnoringSafeArea(.all)
            
            // Create a VStack to vertically stack the elements
            VStack(spacing: 50) {
                // Display the app icon image with specified size and aspect ratio
                Image("app icon@4x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                // Display a "Loading..." text with custom font and color
                Text("Loading...")
                    .font(Font.custom("TropicalAsianDEMO-Regular", size: 55))
                    .foregroundColor(Color(red: 0.94, green: 0.52, blue: 0.38))
            }
            // Add vertical padding to the VStack
            .padding(.vertical, 30.0)
        }
    }
    
    //Debug: show all avaliable fonts in the app
    /*
    init() {
        for familyname in UIFont.familyNames{
            print(familyname)
            
            for fontname in UIFont.fontNames(forFamilyName: familyname){
                print("--\(fontname)")
            }
        }
    }
    */
    
}
