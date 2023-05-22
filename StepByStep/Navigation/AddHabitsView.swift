//
//  AddHabitsView.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//

import SwiftUI
import OmenTextField

struct AddHabitsView: View {

    @Binding var selectedGoal: String

    //Properties
    var body: some View {
        HabitsView(selectedGoal: $selectedGoal)
    }
}

struct AddHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitsView(selectedGoal: .constant("Be a morning person"))
            .previewDevice("iPhone 14 Pro")
    }
}

struct HabitsView: View {

    @Binding var selectedGoal: String
    
    @State private var selectedHabit: String = ""
    
    @State private var showContentView = false // Track whether to show the ContentView

    //Properties
    var body: some View {
        GeometryReader { geometry in

            NavigationView {
                VStack {

                    let habits = setHabits(selectedGoal: selectedGoal)
                        .components(separatedBy: ";")

                    VStack {
                        Spacer().frame(height: 80)
                        Text("Here are some suggestions to help you achieve your goal!")
                            .font(.headline)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                        Spacer().frame(height: 50)
                        Text("Tap one, then continue")
                        Spacer().frame(height: 20)
                    }.lineSpacing(5)


                    VStack {
                        ForEach(habits, id: \.self) { habit in
                            Button(action: {
                                selectedHabit = habit
                            }) {
                                Text(habit)
                            }
                            .buttonStyle(HabitButtonStyle(selected: $selectedHabit, identifier: habit))
                            .padding(.vertical, 10) // Optional: Add padding between buttons

                            Spacer()
                        }
                    }

                    VStack {
                        Text("+")
                        Text("Or add your little step manually :)")
                        
                        OmenTextField("Write your response here", text: .constant(""))
                            .padding(10)
                            .disabled(!selectedHabit.isEmpty)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.05)
                            .opacity(!selectedHabit.isEmpty ? 0.5 : 1.0)

                            .background(
                                Color("LightOrange")
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("LightOrange"), lineWidth: 2)
                                    )
                                    .cornerRadius(20)
                            )
                    }

                    Spacer().frame(height: 30)

                    // Transit to Contentview
                    Button(action: {
                        showContentView = true
                    }, label: {
                        VStack {
                            Image(systemName: "arrow.right.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("Continue")
                        }
                    })

                    Spacer().frame(height: 100)

                }
                    .padding()
            }
        }
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $showContentView) { // Transition to ContentView
            ContentView(selectedGoal: $selectedGoal)
        }
    }
}

func setHabits (selectedGoal: String) -> String {
    switch selectedGoal {
    case "Staying fit":
        return "Exercise regularly;Drink 2L water everyday;Eat salad"
    case "Be a morning person":
        return "Sleep early;Eat breakfast;Have a morning routine"
    case "Learn something new":
        return "Practice regularly;Connect with community;Listen to podcast"
    case "Control my budget":
        return "Review budget;Review spending habits;Transfer money to savings"
    case "Stay mentally healthy":
        return "Meditate;Talk with loved ones;Walk outside"
    case "Be more productive":
        return "Take regular breaks;Sleep early;Review task list before bed"
    default:
        return ""
    }

}
