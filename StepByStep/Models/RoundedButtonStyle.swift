//
//  RoundedButtonStyle.swift
//  StepByStep
//
//  Created by Emily Deng on 14/5/2023.
//

import Foundation
import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        return configuration.label
            .padding(10)
            .background(
                Color("LightOrange")
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("LightOrange"), lineWidth: 2)
                    )
                    .cornerRadius(10)
            )
            .scaleEffect(pressed ? 0.95 : 1.0)
    }
}


//
//
//Button("Button 1") {
//    // Add your button action here
//}
//.buttonStyle(RoundededButtonStyle())
//
