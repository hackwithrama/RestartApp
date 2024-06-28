//
//  ContentView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    
    var body: some View {
        Group{
            if isOnboardingViewActive {
                OnboardingView()
            }else{
                HomeView()
            }
        }
        .animation(.easeOut(duration: 1), value: isOnboardingViewActive)

    }
}

#Preview {
    ContentView()
}
