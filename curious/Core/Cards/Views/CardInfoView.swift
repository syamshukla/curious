//
//  UserInfoView.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI

struct CardInfoView: View {
    
    let user: UserModel
    var body: some View {
        VStack {
            HStack{
                Text(user.fullname ?? "NAME")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(UIColor.systemBackground))

            }
            .foregroundStyle(.white)
            .padding()
          
            }
    }
                }


#Preview {
    CardInfoView( user: MockData.users[0])
}
