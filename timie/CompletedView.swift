//
//  CompletedView.swift
//  timie
//
//  Created by Kyky on 21/04/26.
//

import SwiftUI

struct CompletedView: View {
    @Environment(\.dismiss) var dismiss
    var onDone: () -> Void
    
    let bgYellow = Color(red: 249/255, green: 242/255, blue: 208/255)
    let textBlue = Color(red: 73/255, green: 106/255, blue: 178/255)
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 8) {
                Text("Enjoy it while")
                Text("it’s hot 😋")
            }
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .foregroundColor(textBlue)
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
                    .background(textBlue)
                    .clipShape(Capsule())
            }
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgYellow.ignoresSafeArea())
    }
}

#Preview {
    CompletedView(onDone: {})
}
