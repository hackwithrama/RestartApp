//
//  HomeView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating = false
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                CircleView(circleColor: .secondary, circleOpacity: 0.25)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .offset(y: isAnimating ? 10 : -20)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true).delay(1.5), value: isAnimating)
            }
            .padding()
            
            Text("The time that leads to mastery is depends on intensity of focus")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button{
                isOnboardingViewActive = true
            }label: {
                Label(
                    title: { Text("Restart") },
                    icon: { Image(systemName: "restart.circle") }
                )
                .imageScale(.large)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(.colorBlue)
            .cornerRadius(16)
            
            Spacer()
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    HomeView()
}
