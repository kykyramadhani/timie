//  ContentView.swift
//  timie
//
//  Created by Pelangi Romadoni on 19/04/26.
//

import SwiftUI

struct LevelView: View {
    
    private static let noodleLevels: [Level] = [
        Level(levelName: "Firm", cookingDuration: "1 mins", durationInSeconds: 60, description: "Still kind of hard...", illustration: ""),
        Level(levelName: "Perfect", cookingDuration: "3 mins", durationInSeconds: 180, description: "Perfectly cooked", illustration: ""),
        Level(levelName: "Soft", cookingDuration: "4 mins", durationInSeconds: 240, description: "For someone who loves soft soft noodles", illustration: "")
    ]
    
    @State private var selectedLevel: Level = noodleLevels[0]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("bgColor")
                    .ignoresSafeArea(.all)
                VStack {
                    Text("timie")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .padding(25)
                        .foregroundStyle(Color.black)
                    Text("How do you like your noodles?")
                        .font(Font.system(size: 20, weight: .bold, design: .default))
                        .foregroundStyle(Color("headingColor"))
                        .padding(8)
                    Text("Choose a level.")
                        .font(Font.system(size: 22, weight: .regular, design: .default))
                        .foregroundStyle(Color("subtitleColor"))
                    Spacer(minLength: 20)
                    
                    CardCarousel(
                        activeLevel: $selectedLevel, sourceLevels: Self.noodleLevels
                    )
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    NavigationLink {
//                        TimerView(selectedLevel: selectedLevel)
                        TimerView(timerModel: NoodleTimer(
                                level: selectedLevel,
                                timerDuration: selectedLevel.durationInSeconds,
                                timeRemaining: selectedLevel.durationInSeconds,
                                isStarted: true,
                                illustrations: ["", "", ""]
                            ))
                    } label: {
                        Label {
                            Text("Start Cooking")
                                .font(.system(size: 20, weight: .semibold, design: .default))
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


