//
//  HomeView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    var body: some View {
        VStack(spacing: 30){
            Text("Home view")
                .font(.title)
            Button{
                isOnboardingViewActive = true
            }label: {
                Text("On boarding View")
            }
        }
    }
}

#Preview {
    HomeView()
}
