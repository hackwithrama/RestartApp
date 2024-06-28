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
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 40)
                .frame(width: 260, height: 260)
            Circle()
                .stroke(circleColor.opacity(circleOpacity),lineWidth: 80)
                .frame(width: 260, height: 260)
            
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
