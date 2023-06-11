//
//  BeforeSettingGoalsView.swift
//  StepByStep
//
//  Created by Janet on 10/5/2023.
//

import Foundation
import SwiftUI

/**
 
After the GetStartedView - this view lets users know they don't have any goals or habits set up and they should add one.
 
 */

struct BeforeSettingBigGoalsView: View {
    @State private var selectedIndex: Int?
    @State private var selectedDate: Date = Date() // Initialize selectedDate to the current date
    @State private var showAddGoalView = false // Track whether to show the AddGoalView

    init() {
        //Initialize selectedDate to today's date
        _selectedDate = State(initialValue: Date())
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                // Create a vertical ScrollView to display the calendar and warning message
                ScrollView {
                    // Display the selected date
                    HStack {
                        Text(selectedDate.monthShort() + ". " + selectedDate.dayOfMonth())
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.leading, geometry.size.width * 0.05)

                        Spacer()

                        HStack(spacing: 10) {
                            Button(action: {
                                print("Button Statistic tapped")
                                // add more button Statistic actions here
                            }, label: {
                                Image("statistic")
                                    .renderingMode(.original)
                                    .frame(width: 30, height: 30)
                            })

                            Button(action: {
                                print("Button Settings tapped")
                                // add more button Settings actions here
                            }, label: {
                                Image("settings")
                                    .renderingMode(.original)
                                    .frame(width: 30, height: 30)
                            })
                        }
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                    }
                        .padding(.top, 60)
                        .padding(.horizontal, 0)

                    VStack(spacing: 20) {
                        // Create a horizontal ScrollView to display the calendar
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(-180...180, id: \.self) { index in
                                    VStack {
                                        Text(getCurrentDayOfWeek(selectedDate: Date().addingTimeInterval(TimeInterval(86400 * index))))
                                                            .font(.system(size: 12))
                                                            .foregroundColor(.gray)
                                        Text(String(Date().addingTimeInterval(TimeInterval(86400 * index)).dayOfMonth()))
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(index == 0 ? .orange : .gray)
                                        Text(Date().addingTimeInterval(TimeInterval(86400 * index)).monthShort())
                                            .font(.system(size: 12))
                                            .foregroundColor(.gray)
                                    }
                                        .frame(width: UIScreen.main.bounds.width / 7 - 10, height: 80)
                                        .background(selectedIndex == index + 5 ? Color.orange : Color.white)
                                        .cornerRadius(10)
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                        .onTapGesture {
                                        selectedIndex = index + 5
                                        selectedDate = Date().addingTimeInterval(TimeInterval(86400 * index))
                                    }
                                }

                                Spacer().frame(width: 100)
                            }
                                .frame(width: UIScreen.main.bounds.width + CGFloat(1000 * 20), height: 100)
                                .padding(.horizontal, 20)
                                .background(Color.white)
                        }

                        Spacer()

                        // Display the app icon image with specified size and aspect ratio
                        Image("warning 2@4x")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250)

                        // Display text with custom font and color
                        Text("You haven't set any goals yet!\nTap the button below to get started.")
                        //.font(Font.custom("TropicalAsianDEMO-Regular", size: 35))
                        .font(.system(size: 25))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)

                        // Display the button to add goals
                        Button(action: {
                            // Transition to AddGoalView
                            showAddGoalView = true
                        }) {
                            Image("addGoalButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 180, height: 180)
                        }
                    }
                }
            }
                .navigationBarHidden(true)
                .fullScreenCover(isPresented: $showAddGoalView) { // Transition to AddGoalView
                AddGoalView()
            }
        }
    }
}


// Extension to format Date as short date
extension Date {
    func shortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        return dateFormatter.string(from: self)
    }

    func dayOfMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: self)
    }

    func monthShort() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
}
