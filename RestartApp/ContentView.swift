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
        if isOnboardingViewActive {
            OnboardingView()
        }else{
            HomeView()
        }
    }
}

#Preview {
    ContentView()
}
