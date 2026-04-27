//
//  CardComponent.swift
//  timie
//
//  Created by Kyky on 20/04/26.
//

import SwiftUI

struct CardComponent: View {
    
    @Binding var level: Level
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("mainShapeColor"))
                .frame(width: 264, height: 418)
            
            //Footer thing
//            ZStack{
                VStack{
                    Spacer()
                    Image(level.illustration)
                        .resizable()
                        .frame(width: 200, height: 200)
            
                    Spacer()
                    ZStack{
                        UnevenRoundedRectangle(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 25,
                            bottomTrailingRadius: 25,
                            topTrailingRadius: 0
                        )
                        .foregroundColor(Color("secondShapeColor"))
                        
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
                    .frame(width: 264, height: 170)
                }
            }
            .frame(width: 264, height: 170)
        }
    }

#Preview {
    LevelView()
}
