//
//  CardComponent.swift
//  timie
//
//  Created by Kyky on 20/04/26.
//

import SwiftUI

struct CardComponent: View {
    
    @Binding var level: Level
    
    let bgColor = Color(red: 249/255, green: 242/255, blue: 208/255)
    let headingColor = Color(red: 180/255, green: 59/255, blue: 6/255)
    let subtitleColor = Color(red: 75/255, green: 69/255, blue: 66/255)
    let mainShapeColor = Color(red: 102/255, green: 39/255, blue: 9/255)
    let secondShapeColor = Color(red: 186/255, green: 57/255, blue: 1/255)
    let buttonColor = Color(red: 73/255, green: 106/255, blue: 178/255)

    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(mainShapeColor)
                .frame(width: 264.58, height: 418)
            
            //Footer thing
            ZStack{
                UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 25,
                    bottomTrailingRadius: 25,
                    topTrailingRadius: 0
                )
                .foregroundColor(secondShapeColor)
                
                VStack(alignment: .leading, spacing: 20){
                    HStack {
                        Text(level.levelName)
                            .font(Font.system(size: 22, weight: .bold, design: .default))
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                        Spacer()
                        Label(level.cookingDuration, systemImage: "clock.fill")
                            .font(Font.system(size: 18, weight: .semibold, design: .default))
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                    }
                    Text(level.description)
                        .padding(.horizontal, 20)
                        .foregroundColor(.white)
                }
                
            }
            .frame(width: 264.58, height: 170)
        }
    }
}

