//
//  AddGoalView.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//

import SwiftUI

struct AddGoalView: View {
    
    //Properties
    var body: some View {
        
        //View
        VStack {
        
            Spacer()
            
            VStack {
                Text("Do you have something big you want to achieve?")
                    .font(.headline)
                Text("My goal is...")
                TextField("Add your goal here or choose one below", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).border(.secondary).padding()
                Text("Add a habit to my existing big goal")
            }.lineSpacing(5)
            
            Spacer()
            
            Text("If you're not sure, here are some of our suggestions!")
                .font(.headline)
            
            Spacer()
            
            VStack {
                
                //Staying Fit
                Button(action: {
                    
                }, label: {
                    HStack{
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
                })
                
                //Be a morning person
                Button(action: {
                    
                }, label: {
                    HStack{
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
                })
                
                //Learn something new
                Button(action: {
                    
                }, label: {
                    HStack{
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
                })
                
                //Control my budget
                Button(action: {
                    
                }, label: {
                    HStack{
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
                })
                
                //Stay mentally healthy
                Button(action: {
                    
                }, label: {
                    HStack{
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
                })
                
                //Be more productive
                Button(action: {
                    
                }, label: {
                    HStack{
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
                })
                
                
                
            }
            
            Spacer()
            
            
        }
        .padding()
        
        
    }
    
    //Methods
    
    
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
            .previewDevice("iPhone 14 Pro")
    }
}
