//
//  TimerView.swift
//  timie
//
//  Created by Kyky on 17/04/26.
//

import SwiftUI
internal import Combine

struct TimerView: View {
    @State var timerModel: NoodleTimer
    @Environment(\.dismiss) var dismiss
    @State private var showCancelAlert = false
    @State private var currentFact: String = ""
    
    let facts: [String] = ["4,000-year-old noodles were\nfound in China. Total fossils!",
                           "In Japan, slurping is a huge\ncompliments to the chef.",
                           "Long noodles = long life. Don’t cut them or\nyou’ll trim your luck.",
                           "Ramen was a space pioneer! Astronauts even\neat it in zero-g.",
                           "Italy has 600+ pasta shapes.\nThere’s a noodle for every mood.",
                           "Instant ramen started as a pricey luxury item.\nMajor glow-up!",
                           "One noodle reached 3,000 meters long.\nThat’s a lot of dough!",
                           "The name 'noodle' comes from Germany.\nThanks, Nudel!",
                           "Japan has a whole Cup Noodles Museum.\nIt’s a total vibe.",
                           "Noodles are flash-fried to stay \nfresh forever. Science is tasty!",
                           "Ramen is basically prison currency.\nMove over, cigarettes!"]
    
    
    let timerEngine = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let timerForFacts = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var progressRing: Double {
        return 1.0 - (timerModel.timeRemaining / timerModel.timerDuration)
    }
    
    //    init(selectedLevel: Level) {
    //        _timerModel = State(initialValue: NoodleTimer(
    //            level: selectedLevel,
    //            timerDuration: selectedLevel.durationInSeconds,
    //            timeRemaining: selectedLevel.durationInSeconds,
    //            isStarted: true,
    //            illustrations: ["", "", ""]
    //        ))
    //    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    timerModel.pause()
                    showCancelAlert = true
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
                    Text("\(timerModel.level.levelName.lowercased()) noodles")
                        .bold()
                        .foregroundColor(Color("headingColor"))
                }
                HStack(spacing: 4) {
                    Text("will be")
                        .foregroundColor(.black)
                    Text("cooked in:")
                        .bold()
                        .foregroundColor(Color("headingColor"))
                }
            }
            .font(.system(size: 18))
            
            Text(timerModel.getFormattedTime())
                .font(.system(size: 80, weight: .medium, design: .default))
                .foregroundColor(Color.accentColor)
                .padding(.top, 1)
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 12)
                    .foregroundColor(Color.black.opacity(0.06))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(progressRing))
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round))
                    .foregroundColor(Color("headingColor"))
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.linear(duration: 1.0), value: progressRing)
                
                Circle()
                    .fill(Color.accentColor)
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
                        .foregroundColor(Color.accentColor)
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
                        .background(Color.accentColor)
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 20)
            
            Spacer()
            
            VStack {
                Text("**Noodle Fact:** ")
                Text(currentFact)
                    .onAppear {
                        updateFacts()
                    }
                    .onReceive(timerForFacts) { _ in
                        updateFacts()
                    }
            }
            .font(.system(size: 14))
            .foregroundColor(Color("headingColor"))
            .multilineTextAlignment(.center)
            .padding(7)
            .padding(.bottom, 50)
        }
        .background(Color("bgColor").ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .alert("Cancel Cooking?", isPresented: $showCancelAlert) {
            Button("Stop", role: .destructive) {
                dismiss()
            }
            Button("Resume", role: .cancel) {
                timerModel.pause()
            }
        } message: {
            Text("By exiting you will stop the timer.")
        }
        .onReceive(timerEngine) { _ in
            timerModel.tick()
        }
        .fullScreenCover(isPresented: $timerModel.isDone) {
            CompletedView {
                timerModel.isDone = false
                dismiss()
            }
        }
    }
    
    func updateFacts() {
        withAnimation(.easeInOut(duration: 1)) {
            currentFact = facts.randomElement() ?? ""
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        let previewLevel = Level(
            levelName: "Preview",
            cookingDuration: "3 mins",
            durationInSeconds: 180,
            description: "Just for preview",
            illustration: ""
        )
        
        TimerView(timerModel: NoodleTimer(
            level: previewLevel,
            timerDuration: previewLevel.durationInSeconds,
            timeRemaining: previewLevel.durationInSeconds,
            isStarted: true,
            illustrations: ["", "", ""]
        ))
    }
}
