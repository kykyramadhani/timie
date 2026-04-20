//  ContentView.swift
//  timie
//
//  Created by Pelangi Romadoni on 19/04/26.
//

import SwiftUI

struct LevelView: View {
    
//    @State var levels: [Level] = [
//        Level(levelName: "Perfect", cookingDuration: "3 mins", description: "Perfectly cooked anjay", illustration: ""),
//        
//        Level(levelName: "Firm", cookingDuration: "1 mins", description: "Still kind of hard...", illustration: ""),
//        
//        Level(levelName: "Soft", cookingDuration: "4 mins", description: "For someone who loves soft soft noodles", illustration: "")
//    ]
    
    let bgColor = Color(red: 249/255, green: 242/255, blue: 208/255)
    let headingColor = Color(red: 180/255, green: 59/255, blue: 6/255)
    let subtitleColor = Color(red: 75/255, green: 69/255, blue: 66/255)
    let mainShapeColor = Color(red: 102/255, green: 39/255, blue: 9/255)
    let secondShapeColor = Color(red: 186/255, green: 57/255, blue: 1/255)
    let buttonColor = Color(red: 73/255, green: 106/255, blue: 178/255)

    var body: some View {
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
                
                CardCarousel()
                    .padding(.top, 10)
                                
//                ForEach(0..<levels.count, id : \.self) { index in
//                        CardComponent(level: $levels[index])
//                }
                
                
//                ZStack(alignment: .bottomTrailing){
//                    RoundedRectangle(cornerRadius: 25)
//                        .foregroundColor(mainShapeColor)
//                        .frame(width: 264.58, height: 418)
//                    
//                    //Footer thing
//                    ZStack{
//                        UnevenRoundedRectangle(
//                            topLeadingRadius: 0,
//                            bottomLeadingRadius: 25,
//                            bottomTrailingRadius: 25,
//                            topTrailingRadius: 0
//                        )
//                        .foregroundColor(secondShapeColor)
//                        
//                        VStack(alignment: .leading, spacing: 20){
//                            HStack {
//                                Text(level.levelName)
//                                    .font(Font.system(size: 22, weight: .bold, design: .default))
//                                    .padding(.horizontal, 20)
//                                    .foregroundColor(.white)
//                                Spacer()
//                                Label(level.cookingDuration, systemImage: "clock.fill")
//                                    .font(Font.system(size: 18, weight: .semibold, design: .default))
//                                    .padding(.horizontal, 20)
//                                    .foregroundColor(.white)
//                            }
//                            Text(level.description)
//                                .padding(.horizontal, 20)
//                                .foregroundColor(.white)
//                        }
//                        
//                    }
//                    .frame(width: 264.58, height: 170)
//                    
//                }
                Spacer()
                NavigationLink {
                    Text("placeholder")
                } label: {
                    Label{
                        Text("Start Cooking")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                    } icon:{
                        Image("ChefIcon")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding(.vertical, 20) //best practice is 44x44?
                    .padding(.horizontal, 50)
                    .background(Color.accentColor)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .padding(20)
                    //is there a better way to organize content? i feel like im just putting padding everywhere
                } //changes here
                
                
            }
            
        }
    }
}

#Preview {
    LevelView()
}


