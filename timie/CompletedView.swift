//
//  CompletedView.swift
//  timie
//
//  Created by Kyky on 21/04/26.
//

import SwiftUI
import AVFoundation

struct CompletedView: View {
    @Environment(\.dismiss) var dismiss
    var onDone: () -> Void
    
//    if let path = Bundle.main.path(forResource: "example", ofType: "mp3") {
//        let url = URL(fileURLWithPath: path)
//        do {
//            audioPlayer = try AVAudioPlayer(contentsOf: url)
//            audioPlayer?.play()
//        } catch {
//            print("Could not load file")
//        }
//    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 8) {
                Text("Time's up!\nEnjoy it while it’s hot 😋")
            }
            .font(.system(size: 40, weight: .bold, design: .default))
            .foregroundColor(Color.accentColor)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("🍜")
                .font(Font.system(size: 300))
                .padding(.bottom, 50)
            
            Button(action: {
                onDone()
            }) {
                Text("Back to Home")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 220, height: 60)
                    .background(Color.accentColor)
                    .clipShape(Capsule())
            }
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("bgColor").ignoresSafeArea())
    }
}

#Preview {
    CompletedView(onDone: {})
}
