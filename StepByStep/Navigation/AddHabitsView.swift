//
//  AddHabitsView.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//

import SwiftUI
import OmenTextField

struct AddHabitsView: View {

    let selectedGoal: String

    //Properties
    var body: some View {

        HabitsView(selectedGoal: selectedGoal)

    }
}

struct AddHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitsView(selectedGoal: "Be a morning person")
            .previewDevice("iPhone 14 Pro")
    }
}

struct HabitsView: View {

    let selectedGoal: String

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
                        Text("Tap one, then continue").font(.caption)
                        Spacer().frame(height: 20)
                    }.lineSpacing(5)


                    //Buttons
                    VStack {
                        ForEach(habits, id: \.self) { habit in
                            Button(action: {

                            }, label: {
                                Text(habit)
                            }).buttonStyle(RoundedButtonStyle())

                            Spacer()
                        }

                    }


                    VStack {
                        Text("+")
                        Text("Or add your little step manually :)").font(.caption)
                        OmenTextField("Write your response here", text: .constant(""))
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

                    Spacer().frame(height: 30)

                    //need to add a navigation link here
                    Button(action: {

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
