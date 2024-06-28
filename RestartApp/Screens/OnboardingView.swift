//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = true
    
    var body: some View {
        VStack(spacing: 30){
            Text("On boarding view")
                .font(.title)
            Button{
                isOnboardingViewActive = false
            }label: {
                Text("Home View")
            }
        }
    }
}

#Preview {
    OnboardingView()
}
