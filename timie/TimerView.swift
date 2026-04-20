//
//  TimerView.swift
//  timie
//
//  Created by Kyky on 17/04/26.
//

import SwiftUI
internal import Combine

struct TimerView: View {
    @State private var timerModel = NoodleTimer(
        level: Level(
            levelName: "Perfect Noodles",
            cookingDuration: "3 min",
            description: "Boil until perfect",
            illustration: ""
        ),
        timerDuration: 180,
        timeRemaining: 180,
        isStarted: true,
        illustrations: ["", "", ""]
    )
    
    let timerEngine = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //needs to be added to assets
    let bgYellow = Color(red: 249/255, green: 242/255, blue: 208/255)
    let textBlue = Color(red: 73/255, green: 106/255, blue: 178/255)
    let boldOrange = Color(red: 180/255, green: 59/255, blue: 6/255)
    let strokeOrange = Color(red: 186/255, green: 57/255, blue: 1/255)
    let circleTrack = Color.black.opacity(0.06)
    
    var progressRing: Double {
        return 1.0 - (timerModel.timeRemaining / timerModel.timerDuration)
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    //action close, will code the popup later
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .padding(12)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 10)
            
            Spacer()
            
            VStack(spacing: 4) {
                HStack(spacing: 4) {
                    Text("Your")
                        .foregroundColor(.black)
                    Text("perfect noodles")
                        .bold()
                        .foregroundColor(boldOrange)
                }
                HStack(spacing: 4) {
                    Text("will be")
                        .foregroundColor(.black)
                    Text("cooked in:")
                        .bold()
                        .foregroundColor(boldOrange)
                }
            }
            .font(.system(size: 18))
            
            Text(timerModel.getFormattedTime())
                .font(.system(size: 80, weight: .medium, design: .default))
                .foregroundColor(textBlue)
                .padding(.top, 1)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 12)
                    .foregroundColor(circleTrack)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(progressRing))
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .foregroundColor(strokeOrange)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.linear(duration: 1.0), value: progressRing)
                
                Circle()
                    .fill(textBlue)
                    .frame(width: 28, height: 28)
                    .offset(y: -130)
                    .rotationEffect(Angle(degrees: progressRing * 360))
                    .animation(.linear(duration: 1.0), value: progressRing)
            }
            .frame(width: 260, height: 260)
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: {
                    timerModel.pause()
                }) {
                    Image(systemName: timerModel.isPaused ? "play.fill" : "pause.fill")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(textBlue)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    timerModel.isDone = true
                    timerModel.isStarted = false
                }) {
                    Text("Done")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 160, height: 60)
                        .background(textBlue)
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 20)
            
            Spacer()
            
            VStack {
                Text("**Noodle fact:** Noodles are at least\n4000 years old. Classic.") //we'll gonna use randomized array later tho this is just for reference
            }
            .font(.system(size: 14))
            .foregroundColor(strokeOrange)
            .multilineTextAlignment(.center)
            .padding(.bottom, 60)
        }
        .background(bgYellow.ignoresSafeArea())
        .onReceive(timerEngine) { _ in
            timerModel.tick()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
