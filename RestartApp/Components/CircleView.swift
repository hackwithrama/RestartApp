//
//  CircleView.swift
//  RestartApp
//
//  Created by Ramachandran Varadaraju on 28/06/24.
//

import SwiftUI

struct CircleView: View {
    @State var circleColor: Color
    @State var circleOpacity: CGFloat
    @State private var isAnimating = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 40)
                .frame(width: 260, height: 260)
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 80)
                .frame(width: 260, height: 260)
            
        }
        .opacity(isAnimating ? 1 : 0.2)
        .blur(radius: isAnimating ? 0 : 10)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .onAppear{
            withAnimation(.easeInOut(duration: 1)){
                isAnimating = true
            }
        }
    }
}

#Preview {
    ZStack{
        Color.teal
            .ignoresSafeArea()
        CircleView(circleColor: .white, circleOpacity: 0.25)
    }
}
