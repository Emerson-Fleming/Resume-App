//
//  View2.swift
//  Resume App
//
//  Created by Emerson Fleming on 3/10/23.
//

import Foundation
import SwiftUI
import UIKit

struct View2: View {
    let animationDuration = 1.0 // set the duration of the animation
    
    @State private var opacity = 0.0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Work Experience")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("I am in pursuit of an internship in the tech industry")
            Text("I am a computer science student with minors in data science and mathematics")
            Text("I have internship experience in software and application development")
            Text("I built this app in Xcode using Swift, UIKit, and SwiftUI")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .opacity(opacity)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: animationDuration)) {
                self.opacity = 1.0
            }
        }
        .onDisappear {
            self.opacity = 0.0
        }
    }
}
