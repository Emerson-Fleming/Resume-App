//
//  View3.swift
//  Resume App
//
//  Created by Emerson Fleming on 3/10/23.
//

import Foundation
import SwiftUI
import UIKit

struct View3: View {
    let animationDuration = 1.0 // set the duration of the animation
    
    @State private var opacity = 0.0
    var body: some View {
        VStack {
            Text("Emerson Fleming")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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
