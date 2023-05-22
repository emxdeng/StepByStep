//
//  HomeScreenView.swift
//  StepByStep
//
//  Created by Janet on 22/5/2023.
//

import Foundation
import SwiftUI

struct HomeScreenView: View {
    @Binding var habitText: String
    var habitColor: Color?
    
    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Helpful Habit", text: $habitText)
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .background(habitColor ?? Color.orange)
                .cornerRadius(10)
                .padding()
        }
    }
}


struct HomeScreenView_Preview: PreviewProvider {
    static var previews: some View {
        HomeScreenView(habitText: .constant("7DA3D6"))
            .previewDevice("iPhone 14 Pro")
    }
}




























