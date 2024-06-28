//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var imageOffset: CGSize = .zero
    @State private var isAnimating = false
    
    var body: some View {
        ZStack{
            Color.colorBlue
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                // MARK: HEADER
                VStack{
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("It's not how much we give but how much love we put into giving")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
                .opacity(isAnimating ? 1.0 : 0.5)
                .offset(y: isAnimating ? 0 : -100)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                Spacer()
                
                // MARK: MAIN CONTENT
                ZStack{
                    CircleView(circleColor: .white, circleOpacity: 0.25)
                        .offset(x: -imageOffset.width * 1.2, y: 0)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeInOut, value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged{value in
                                    if abs(imageOffset.width) <= 150{
                                        imageOffset = value.translation
                                    }
                                }
                            
                                .onEnded{_ in
                                    withAnimation(Animation.easeOut(duration: 0.8)){
                                        imageOffset = .zero
                                    }
                                }
                        )
                }//: ZStack
                
                
                Spacer()
                
                 // MARK: FOOTER
                ZStack{
                    // BACKGROUND
                    ZStack{
                        Capsule()
                            .fill(.white.opacity(0.25))
                        Capsule()
                            .fill(.white.opacity(0.25))
                            .padding(10)
                    }
                    
                    // Call-to-actionn
                    Text("Drag to get started")
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .offset(x: 50)
                    
                    // Dynamic capsule
                    HStack{
                        Capsule()
                            .fill(.colorRed)
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    // Draggable circle
                    HStack {
                        ZStack{
                            Circle()
                                .fill(.colorRed)
                                .overlay(
                                    Circle()
                                        .fill(.black.opacity(0.25))
                                        .padding(8)
                                )
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{value in
                                    if value.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = value.translation.width
                                    }
                                }
                            
                                .onEnded{_ in
                                    withAnimation(Animation.easeOut(duration: 0.5)){
                                        if buttonOffset > buttonWidth / 2{
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }else {
                                            buttonOffset = 0
                                        }
                                    }
                                    
                                }
                        )
                        
                        Spacer()
                    }
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                    
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .opacity(isAnimating ? 1.0 : 0.5)
                .offset(y: isAnimating ? 0 : 100)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                Spacer()
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    OnboardingView()
}
