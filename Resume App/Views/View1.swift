//
//  View1.swift
//  Resume App
//
//  Created by Emerson Fleming on 3/10/23.
//

import Foundation
import SwiftUI
import UIKit

struct View1: View {
    let animationDuration = 1.0 // set the duration of the animation
    
    @State private var opacity = 0.0
    
    var body: some View {
        VStack {
            Group{
                Image("ProfPic", bundle: Bundle.main)
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                    .padding([.top], 20)
                Text("Emerson Fleming")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top], 15)
                Text("iOS Swift Developer in Pursuit of a Software Development Internship")
                    .font(.system(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding([.top], 5)
                Divider()
            }
            Group{
                Text("Contact Info")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                VStack{
                    Spacer()
                    List {
                        Group {
                            Button(action: {
                                guard let url = URL(string: "tel://7752293808") else { return }
                                UIApplication.shared.open(url)
                            }) {
                                HStack {
                                    Image(systemName: "phone.fill")
                                    //.alignmentGuide(.custom) { d in d[.bottom] }
                                    Text("Call")
                                }
                            }
                            Button(action: {
                                guard let url = URL(string: "mailto:efleming@nevada.unr.edu") else { return }
                                UIApplication.shared.open(url)
                            }) {
                                HStack {
                                    Image(systemName: "envelope.fill")
                                    //.alignmentGuide(.custom) { d in d[.bottom] }
                                    Text("Email")
                                }
                            }
                            Button(action: {
                                guard let url = URL(string: "https://www.linkedin.com/in/emersonfleming/") else { return }
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }) {
                                HStack {
                                    Image("linkedin", bundle: Bundle.main)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("LinkedIn")
                                }
                            }
                            Button(action: {
                                guard let url = URL(string: "https://github.com/Emerson-Fleming") else { return }
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }) {
                                HStack {
                                    Image("github", bundle: Bundle.main)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    Text("GitHub Portfolio")
                                }
                            }
                        }
                    }
                    //.scrollDisabled(true)
                }
                Spacer()
            }
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
