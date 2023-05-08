//
//  AppLogoView.swift
//  StepByStep
//
//  Created by Janet on 8/5/2023.
//

import SwiftUI

struct AppLogoView: View {
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.99, green: 0.93, blue: 0.87, alpha: 1.0)).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                Image("app icon@4x")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("Loading...")
//                    .font(Font.custom("TropicalAsianDEMO-Regular", size: 55))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 50)
        }
    }
}
