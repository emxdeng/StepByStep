//
//  HabitButtonStyle.swift
//  StepByStep
//
//  Created by Emily Deng on 21/5/2023.
//

import Foundation
import SwiftUI

struct HabitButtonStyle: ButtonStyle {
    @Binding var selected: String
    let identifier: String
    
    func makeBody(configuration: Configuration) -> some View {
        let pressed = configuration.isPressed
        
        return GeometryReader { geometry in
            configuration.label
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.35)
                .padding(11)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(selected == identifier ? Color("Orange") : Color("LightOrange"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("LightOrange"), lineWidth: selected == identifier ? 0 : 2)
                        )
                )
                .scaleEffect(pressed ? 0.95 : 1.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .onTapGesture {
                    selected = identifier
                }
        }
    }
}
