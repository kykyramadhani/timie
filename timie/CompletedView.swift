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
    @State private var audioPlayer: AVAudioPlayer?
    
    
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 8) {
                Text("Time's up!")
            }
            .font(.system(size: 40, weight: .bold, design: .default))
            .foregroundColor(Color.accentColor)
            .multilineTextAlignment(.center)
            .padding(10)
            Text("Enjoy it while it’s hot :)")
                .font(Font.system(size: 20, weight: .semibold))
                .foregroundStyle(Color("subtitleColor"))
            
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
        .onAppear {
            playSound()
        }
        .onDisappear {
            audioPlayer?.stop()
        }
    }
    
    func playSound() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set audio session category.")
        }
        
        guard let url = Bundle.main.url(forResource: "blip", withExtension: "wav") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Audio Player Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CompletedView(onDone: {})
}
