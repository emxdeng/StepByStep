//
//  StepByStepApp.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//

import SwiftUI

@main
struct StepByStepApp: App {
    @State var currentView: AnyView = AnyView(AppLogoView())
    
    var body: some Scene {
        WindowGroup {
            currentView
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            currentView = AnyView(GetStartedView())
                        }
                    }
                }
        }
    }
}
