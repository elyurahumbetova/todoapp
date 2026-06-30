//
//  SplashView.swift
//  todoapp
//
//  Created by Elyura on 30.06.26.
//

import SwiftUI

struct SplashView: View {
    @State private var logoScale: CGFloat = 0
    @State private var logoOpacity: CGFloat = 0
    @State private var textOffset: CGFloat = 30
    @State private var textOpacity: CGFloat = 0
    @State private var rotation: CGFloat = -270
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Image("logo")
                    .resizable()
                    .frame(width: 250,height: 250)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                    .rotationEffect(.degrees(rotation))

                Text("TodoApp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .offset(y: textOffset)
                    .opacity(textOpacity)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.5)) {
                rotation = 0
                logoScale = 1.0
                logoOpacity = 1.0
            }

            withAnimation(.easeInOut(duration: 0.5).delay(0.3)){
                        textOffset = 0
                        textOpacity = 1.0
                    }
                }
    }
}

#Preview {
    SplashView()
}
