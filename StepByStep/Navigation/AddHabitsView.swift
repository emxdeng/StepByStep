//
//  AddHabitsView.swift
//  StepByStep
//
//  Created by Emily Deng on 7/5/2023.
//

import SwiftUI

struct AddHabitsView: View {
    
    //Properties
    var body: some View {
        
        
        //View
        VStack {
            Spacer()
            
            VStack {
                Spacer()
                Text("Here are some suggestions to help you achieve your goal!")
                    .font(.headline)
                Spacer()
                Text("Tap one, then continue").font(.caption)
                Spacer()
            }.lineSpacing(5)
            
            
            //Buttons
            VStack{
                //Exercise regularly
                Button(action: {
                    
                }, label: {
                    Text("Exercise regularly")
                })
                
                Spacer()
                
                //Drink 2L water everyday
                Button(action: {
                    
                }, label: {
                    Text("Drink 2L water everyday")
                })
                
                Spacer()
                
                //Eat salad
                Button(action: {
                    
                }, label: {
                    Text("Eat salad")
                })
                Spacer()
            
                
            }
            
            Spacer()
            
            VStack {
                Text("+")
                Text("Or add your little step manually :)").font(.caption)
                TextField("Write your response here", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).border(.secondary).padding()
               
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                VStack {
                    Image(systemName: "arrow.right.circle")
                        .resizable()
                        .frame(width:50,height:50)
                    Text("Continue")
                }
            })
           
            Spacer()
            
        }
        .padding()
        

        
        
    }
    
    //Methods
    
    
}

struct AddHabitsView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitsView()
            .previewDevice("iPhone 14 Pro")
    }
}
