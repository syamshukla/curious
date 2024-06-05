//
//  SwipeActionIndicatorView.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xOffset: CGFloat
    
    
    var body: some View {
        HStack{
            Circle()
                .fill(Color.green)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset/SizeConstants.screenCutoff))
            
            Spacer()
            Circle()
                .fill(Color.red)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset/SizeConstants.screenCutoff) * -1 )
            }
        .padding()
        }
        
    }

#Preview {
    SwipeActionIndicatorView(xOffset: .constant(20))
}
