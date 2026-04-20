//
//  CardCarousel.swift
//  timie
//
//  Created by Kyky on 20/04/26.
//

import SwiftUI

struct CardCarousel: View {
    // 1. Ganti Data Colors menjadi Data Levels
    private let baseLevels: [Level] = [
        Level(levelName: "Perfect", cookingDuration: "3 mins", description: "Perfectly cooked anjay", illustration: ""),
        Level(levelName: "Firm", cookingDuration: "1 mins", description: "Still kind of hard...", illustration: ""),
        Level(levelName: "Soft", cookingDuration: "4 mins", description: "For someone who loves soft soft noodles", illustration: "")
    ]
    
    @State private var scrollPosition: Int?
    @State private var itemsArray: [[Level]] = []
    
    // Lebar CardComponent (264.58) + Padding Kiri & Kanan (10 + 10 = 20)
    private let totalItemWidth: CGFloat = 284.58
    private let animationDuration: CGFloat = 0.3

    var body: some View {
        let itemsTemp = itemsArray.flatMap { $0 }
        
        // Menggunakan GeometryReader agar tidak kena warning UIScreen.main.bounds
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<itemsTemp.count, id: \.self) { index in
                        let item = itemsTemp[index]
                        
                        // Panggil CardComponent di sini
                        CardComponent(level: .constant(item))
                            // Tambahkan sedikit jarak antar card
                            .padding(.horizontal, 10)
                    }
                }
                .scrollTargetLayout()
            }
            // Kalkulasi padding otomatis untuk posisi tengah
            .safeAreaPadding(.horizontal, (geometry.size.width - totalItemWidth) / 2)
            .scrollPosition(id: $scrollPosition)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned) // ViewAligned sangat penting untuk card custom width
            .onAppear {
                self.itemsArray = [baseLevels, baseLevels, baseLevels]
                // Start di item pertama dari array kedua
                scrollPosition = baseLevels.count
            }
            // Menggunakan syntax onChange terbaru iOS 17
            .onChange(of: scrollPosition) { oldValue, newValue in
                guard let scrollPos = newValue else { return }
                
                let itemCount = baseLevels.count
                
                // Jika user scroll ke item terakhir dari array pertama
                if scrollPos / itemCount == 0 && scrollPos % itemCount == itemCount - 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now(   ) + animationDuration) {
                        itemsArray.removeLast()
                        itemsArray.insert(baseLevels, at: 0)
                        self.scrollPosition = scrollPos + itemCount
                    }
                    return
                }
                
                // Jika user scroll ke item pertama dari array terakhir
                if scrollPos / itemCount == 2 && scrollPos % itemCount == 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                        itemsArray.removeFirst()
                        itemsArray.append(baseLevels)
                        self.scrollPosition = scrollPos - itemCount
                    }
                    return
                }
            }
        }
    }
}


#Preview {
    CardCarousel()
}
