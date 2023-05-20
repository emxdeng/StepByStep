//
//  AddGoalView.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//

import SwiftUI
import Foundation

struct AddGoalView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height:16)
                    
                Text("Do you have something big you want to achieve?")
                    .font(.custom("Skia", size: 20))
                    .offset(x:-10)
                
                Spacer().frame(height:50)
                
                NavigationLink(
                    destination: AddHabitsView(selectedButton: "Staying fit")) {
                        Button(action: {
                        }, label: {
                            HStack {
                                Spacer()
                                Image("dumbbell@4x")
                                    .resizable()
                                    .frame(width: 50, height: 30)
                                Spacer()
                                Text("Staying fit")
                                    .font(.callout)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }).buttonStyle(RoundedButtonStyle())
                    }


                //Be a morning person
                NavigationLink(destination: AddHabitsView(selectedButton: "Be a morning person")) {
                    Button(action: {
                    }, label: {
                        HStack {
                            Spacer()
                            Image("sun@4x")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Spacer()
                            Text("Be a morning person")
                                .font(.callout)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }).buttonStyle(RoundedButtonStyle())
                }

                //Learn something new
                NavigationLink(destination: AddHabitsView(selectedButton: "Learn something new")) {
                    Button(action: {
                    }, label: {
                        HStack {
                            Spacer()
                            Image("book@4x")
                                .resizable()
                                .frame(width: 30, height: 40)
                            Spacer()
                            Text("Learn something new")
                                .font(.callout)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }).buttonStyle(RoundedButtonStyle())
                }


                //Control my budget
                NavigationLink(destination: AddHabitsView(selectedButton: "Control my budget")) {
                    Button(action: {
                    }, label: {
                        HStack {
                            Spacer()
                            Image("money@4x")
                                .resizable()
                                .frame(width: 30, height: 40)
                            Spacer()
                            Text("Control my budget")
                                .font(.callout)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }).buttonStyle(RoundedButtonStyle())
                }


                //Stay mentally healthy
                NavigationLink(destination: AddHabitsView(selectedButton: "Stay mentally healthy")) {
                    Button(action: {
                    }, label: {
                        HStack {
                            Spacer()
                            Image("locked heart@4x")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Spacer()
                            Text("Stay mentally healthy")
                                .font(.callout)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }).buttonStyle(RoundedButtonStyle())
                }


                //Be more productive
                NavigationLink(destination: AddHabitsView(selectedButton: "Be more productive")) {
                    Button(action: {

                    }, label: {
                        HStack {
                            Spacer()
                            Image("cogwheel@4x")
                                .resizable()
                                .frame(width: 40, height: 40)
                            Spacer()
                            Text("Be more productive")
                                .font(.callout)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }).buttonStyle(RoundedButtonStyle())
                }


                Spacer()


            }
                .padding()
                .navigationTitle("Add New Goal")



        }
    }

}


struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
            .previewDevice("iPhone 14 Pro")
    }
}

