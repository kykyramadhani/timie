//  ContentView.swift
//  timie
//
//  Created by Pelangi Romadoni on 19/04/26.
//

import SwiftUI

struct LevelView: View {
    
    private let noodleLevels: [Level] = [
        Level(levelName: "Perfect", cookingDuration: "3 mins", durationInSeconds: 180, description: "Perfectly cooked anjay", illustration: ""),
        Level(levelName: "Firm", cookingDuration: "1 mins", durationInSeconds: 60, description: "Still kind of hard...", illustration: ""),
        Level(levelName: "Soft", cookingDuration: "4 mins", durationInSeconds: 240, description: "For someone who loves soft soft noodles", illustration: "")
    ]
    
    @State private var selectedLevel: Level
    let bgColor = Color(red: 249/255, green: 242/255, blue: 208/255)
    let headingColor = Color(red: 180/255, green: 59/255, blue: 6/255)
    let subtitleColor = Color(red: 75/255, green: 69/255, blue: 66/255)
    let mainShapeColor = Color(red: 102/255, green: 39/255, blue: 9/255)
    let secondShapeColor = Color(red: 186/255, green: 57/255, blue: 1/255)
    let buttonColor = Color(red: 73/255, green: 106/255, blue: 178/255)

    init() {
        _selectedLevel = State(initialValue: [
            Level(levelName: "Perfect", cookingDuration: "3 mins", durationInSeconds: 180, description: "Perfectly cooked anjay", illustration: ""),
            Level(levelName: "Firm", cookingDuration: "1 mins", durationInSeconds: 60, description: "Still kind of hard...", illustration: ""),
            Level(levelName: "Soft", cookingDuration: "4 mins", durationInSeconds: 240, description: "For someone who loves soft soft noodles", illustration: "")
        ][0])
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                bgColor.edgesIgnoringSafeArea(.all)
                VStack {
                    Text("timie")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .padding(25)
                    Text("How do you like your noodles?")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(headingColor)
                        .padding(8)
                    Text("Choose a level.")
                        .font(Font.system(size: 22, weight: .regular, design: .default))
                        .foregroundColor(subtitleColor)
                    Spacer(minLength: 20)
                    
                    CardCarousel(
                        activeLevel: $selectedLevel, sourceLevels: noodleLevels 
                    )
                    .padding(.top, 10)
                    
                    
                    Spacer()
                    
                    NavigationLink {
                        TimerView(selectedLevel: selectedLevel)
                    } label: {
                        Label {
                            Text("Start Cooking")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                        } icon:{
                            Image("ChefIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 50)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                        .padding(20)
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    LevelView()
}


