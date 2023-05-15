//
//  ContentView.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//  Modified by Sunjun (Lucie) Kwak on 8/5/2023.

import SwiftUI

struct CustomColor {
    static let textColor = Color("TextColor")
    static let gray = Color("Gray")
    static let lightOrange = Color("LightOrange")
    static let habitColor1 = Color("FAC088")
    static let habitColor2 = Color("F29094")
    static let habitColor3 = Color("A6CFF0")
    static let habitColor4 = Color("F08461")
    static let habitColor5 = Color("91C483")
    static let habitColor6 = Color("F08675")
    static let habitColor7 = Color("ECC268")
    static let habitColor8 = Color("A7C86E")
    static let habitColor9 = Color("7DA3D6")
    static let habitColor10 = Color("9784BD")
    static let habitColor11 = Color("EC648A")
    static let habitColor12 = Color("F28D39")
    static let habitColor13 = Color("77C7CC")
    static let habitColor14 = Color("BABEC9")
    static let habitColor15 = Color("B9CF4D")
    static let habitColor16 = Color("B83325")
    static let habitColor17 = Color("EDC33E")
    static let habitColor18 = Color("52905B")
    static let habitColor19 = Color("247CB9")
    static let habitColor20 = Color("775C45")
    static let habitColor21 = Color("D6746B")
    static let habitColor22 = Color("EC928B")
    static let habitColor23 = Color("E6A7B4")
    static let habitColor24 = Color("F1B2A4")
    static let habitColor25 = Color("EC987E")
}

struct ContentView: View {
    @State private var hasDueDate = true
    @State private var selectedDate = Date()
    @State private var habitText = ""
    @State private var selectedHabitColor: Color? = nil
    @State private var selectedDays: [String] = []
    
    var body: some View {
        
        // Code for title of this screen
        Text("Now let's set the specifics of\nyour goal and habit :)")
            .font(Font.custom("Skia", size: 22))
            .foregroundColor(CustomColor.textColor)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            
        // Code for choosing the goal the habit is part of
            VStack {
                Text("My goal")
                    .font(.system(size: 22))
                    .fontWeight(.regular)
                    .foregroundColor(CustomColor.textColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .alignmentGuide(.leading) { _ in 0 }
                DisclosureGroup(/*@START_MENU_TOKEN@*/"Group"/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }
            }
        
        // Code for setting the due date of the goal
            VStack {
                HStack {
                    Text("Due date")
                        .font(.system(size: 22))
                        .fontWeight(.regular)
                        .foregroundColor(hasDueDate ? CustomColor.textColor : CustomColor.gray)
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Toggle(isOn: $hasDueDate) {
                                Text("")
                            }
                            
                            Text("(No due date)")
                                .fontWeight(.regular)
                                .foregroundColor(hasDueDate ? CustomColor.textColor : CustomColor.gray)
                                .font(.system(size: 16))
                        }
                    }
                }
                if hasDueDate {
                    DatePicker(selection: $selectedDate, displayedComponents: [.date], label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                        .background(CustomColor.lightOrange)
                }
            }
        
        // Code for 'helpful habit' that the user will input
        Form {
            Section(header: Text("Helpful habit")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .textCase(.none)
            ) {
                TextField("Write your habit here...", text: $habitText)
                    .background(selectedHabitColor)
                    .foregroundColor(selectedHabitColor != nil ? .white : CustomColor.textColor)
            }
            
            // Code for habit color palette
            Section(header: Text("Habit colour")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .textCase(.none)
            ) {
                HStack {
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor1)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor1
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor2)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor2
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor3)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor3
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor4)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor4
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor5)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor5
                    }
                }
                
                HStack {
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor6)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor6
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor7)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor7
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor8)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor8
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor9)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor9
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor10)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor10
                    }
                }
                HStack {
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor11)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor11
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor12)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor12
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor13)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor13
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor14)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor14
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor15)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor15
                    }
                }
                HStack {
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor16)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor16
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor17)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor17
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor18)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor18
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor19)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor19
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor20)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor20
                    }
                }
                HStack {
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor21)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor21
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor22)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor22
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor23)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor23
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor24)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor24
                    }
                    
                    Button("") {
                    }
                    .frame(width: 50, height: 50)
                    .background(CustomColor.habitColor25)
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedHabitColor = CustomColor.habitColor25
                    }
                }
            }
        }
        
        // Code for weekly calendar
        VStack {
            Text("How often?")
                .font(.system(size: 22))
                .fontWeight(.regular)
                .foregroundColor(CustomColor.textColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .alignmentGuide(.leading) { _ in 0 }
            WeekdayPicker(selectedDays: $selectedDays, selectedHabitColor: $selectedHabitColor)
                    .padding()
        }
        
        // Code for setting time
        
        // Code for setting amount of time or number of times per day
        
        // Code for 'save' button
    }
    
    struct WeekdayPicker: View {
        @Binding var selectedDays: [String]
        @Binding var selectedHabitColor: Color?

        let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

        var body: some View {
            HStack(spacing: 4) {
                ForEach(weekdays, id: \.self) { weekday in
                    Button(action: {
                        if selectedDays.contains(weekday) {
                            selectedDays.removeAll { $0 == weekday }
                        } else {
                            selectedDays.append(weekday)
                        }
                    }) {
                        Text(weekday)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(selectedDays.contains(weekday) ? .white : .black)
                            .background(selectedDays.contains(weekday) ? (selectedHabitColor ?? Color.blue) : Color.clear)
                            .cornerRadius(8)
                            .fixedSize()
                    }
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
