//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    @State private var imageOffset: CGPoint = .zero
    @State private var buttonWidth = UIScreen.main.bounds.width - 32
    
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
                
                Spacer()
                
                // MARK: MAIN CONTENT
                ZStack{
                    ZStack{
                        Circle()
                            .stroke(.white.opacity(0.25),lineWidth: 40)
                            .frame(width: 260, height: 260)
                        Circle()
                            .stroke(.white.opacity(0.25),lineWidth: 80)
                            .frame(width: 260, height: 260)
                        
                    }
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
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
                        .offset(x: 60)
                    
                    // Dynamic capsule
                    HStack{
                        Capsule()
                            .fill(.colorRed)
                            .frame(width: 80)
                        Spacer()
                    }
                    
                    // Draggable circle
                    HStack {
                        ZStack{
                            Circle()
                                .fill(.colorRed)
                                .overlay(
                                    Circle()
                                        .fill(.black.opacity(0.5))
                                        .padding(8)
                                )
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .onTapGesture {
                        isOnboardingViewActive = false
                    }
                    
                }
                .frame(height: 80, alignment: .center)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
