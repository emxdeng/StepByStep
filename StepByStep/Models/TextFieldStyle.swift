//
//  TextFieldStyle.swift
//  StepByStep
//
//  Created by Emily Deng on 14/5/2023.
//

import Foundation
import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding(10)
            .background(
                Color("LightOrange")
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("LightOrange"), lineWidth: 2)
                    )
                    .cornerRadius(20)
            )
    }
}
