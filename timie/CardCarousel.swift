//
//  CardCarousel.swift
//  timie
//
//  Created by Kyky on 20/04/26.
//

import SwiftUI

struct CardCarousel: View {
    @Binding var activeLevel: Level
    @State private var scrollPosition: Int?
    @State private var itemsArray: [[Level]] = []
    
    let sourceLevels: [Level]
    private let totalItemWidth: CGFloat = 284.58
    private let animationDuration: CGFloat = 0.3

    var body: some View {
        let itemsTemp = itemsArray.flatMap { $0 }
        
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<itemsTemp.count, id: \.self) { index in
                        let item = itemsTemp[index]
                        
                        CardComponent(level: .constant(item))
                            .padding(.horizontal, 10)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, (geometry.size.width - totalItemWidth) / 2)
            .scrollPosition(id: $scrollPosition)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            .onAppear {
                self.itemsArray = [sourceLevels, sourceLevels, sourceLevels]
                scrollPosition = sourceLevels.count
            }
            .onChange(of: scrollPosition) { oldValue, newValue in
                guard let scrollPos = newValue else { return }
                
                let itemCount = sourceLevels.count
                activeLevel = sourceLevels[scrollPos % itemCount]
                            
                if scrollPos / itemCount == 0 && scrollPos % itemCount == itemCount - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        itemsArray.removeLast()
                        itemsArray.insert(sourceLevels, at: 0)
                        self.scrollPosition = scrollPos + itemCount
                    }
                    return
                }
                
                if scrollPos / itemCount == 2 && scrollPos % itemCount == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        itemsArray.removeFirst()
                        itemsArray.append(sourceLevels)
                        self.scrollPosition = scrollPos - itemCount
                    }
                    return
                }
            }
        }
    }
}


