//
//  Timer.swift
//  timie
//
//  Created by Kyky on 17/04/26.
//

import Foundation

struct NoodleTimer: Identifiable {
    let id: UUID = UUID()
    var level: Level
    
    var timerDuration: TimeInterval
    var timeRemaining: TimeInterval
    
    var isDone: Bool = false
    var isPaused: Bool = false
    var isStarted: Bool = false
    
    var illustrations: [String]
    var currentIllustrationIndex: Int = 0
    
    mutating func start() {
        isStarted = true
        isPaused = false
        isDone = false
    }

    mutating func pause() {
        isPaused = true
    }

    mutating func reset() {
        isStarted = false
        isPaused = false
        isDone = false
        timeRemaining = timerDuration
        currentIllustrationIndex = 0
    }
    
    mutating func tick() {
            guard isStarted && !isPaused && timeRemaining > 0 else { return } //to not do anything when the timer hasnt started.. this is only just in case
            
            timeRemaining -= 1
            
            if timeRemaining <= 0 {
                //time is up
                isDone = true
                isStarted = false
                currentIllustrationIndex = illustrations.isEmpty ? 0 : illustrations.count - 1
            } else {
                //check if changing the illustration is needed
                updateIllustration()
            }
        }
    
    
    mutating private func updateIllustration() {
            guard !illustrations.isEmpty else { return }
        
            //counting percentage of the progress so that we dont do bunch of if-elses
            let progress = 1.0 - (timeRemaining / timerDuration)
            let totalImages = Double(illustrations.count)
            
            //setting the index of the illustration
            let calculatedIndex = Int(progress * totalImages)
            currentIllustrationIndex = min(calculatedIndex, illustrations.count - 1)
        }
    
    //helper func to format from timeinterval to string.. the output will be like 01:00
    func getFormattedTime() -> String {
            let minutes = Int(timeRemaining) / 60
            let seconds = Int(timeRemaining) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
}
