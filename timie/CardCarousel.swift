//
//  CardCarousel.swift
//  timie
//
//  Created by Kyky on 20/04/26.
//

import SwiftUI

struct CardCarousel: View {
    @Binding var activeLevel: Level
    @State private var scrollPosition: Int? = 1
    
    let sourceLevels: [Level]
    private let totalItemWidth: CGFloat = 284.58
    private let animationDuration: CGFloat = 0.1
    

    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<sourceLevels.count, id: \.self) { index in
                        let item = sourceLevels[index]
                        
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
                updateActiveLevel(index: scrollPosition)
            }
            .onChange(of: scrollPosition) { oldValue, newValue in
                updateActiveLevel(index: scrollPosition)
            }
        }
    }
    
private func updateActiveLevel(index: Int?) {
    if let position = index {
            let targetIndex = position % sourceLevels.count
            
            if targetIndex >= 0 && targetIndex < sourceLevels.count {
                activeLevel = sourceLevels[targetIndex]
            }
        }
    }
}



