//
//  CompletedView.swift
//  timie
//
//  Created by Kyky on 21/04/26.
//

import SwiftUI

struct CompletedView: View {
    let bgColor = Color(red: 249/255, green: 242/255, blue: 208/255)
    let headingColor = Color(red: 180/255, green: 59/255, blue: 6/255)
    let subtitleColor = Color(red: 75/255, green: 69/255, blue: 66/255)
    let mainShapeColor = Color(red: 102/255, green: 39/255, blue: 9/255)
    let secondShapeColor = Color(red: 186/255, green: 57/255, blue: 1/255)
    let buttonColor = Color(red: 73/255, green: 106/255, blue: 178/255)
    
    var body: some View {
        VStack{
            Text("Enjoy it while it's hot 😋")
                .font(.system(size: 20, weight: .bold, design: .default))
            
        }
    }
}

#Preview {
    CompletedView()
}
