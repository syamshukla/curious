//
//  CardStackView.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardsViewModel(service:CardService())
    var body: some View {
        NavigationStack {
            VStack(spacing:16) {
                ZStack{
                    ForEach(viewModel.cardModels){
                        card in CardView(
                            viewModel: viewModel,
                            model: card
                        )
                    }
                }
                
                if !viewModel.cardModels.isEmpty{
                    SwipeActionButtonsView(viewModel: viewModel)
                }
            }
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.topBarLeading) {
                    Text("Curious?")
                        .foregroundColor(.orange)
                        .font(.title)
                        .fontWeight(.semibold)
                        
                }
            }

        }
       
        
    }
}

#Preview {
    CardStackView()
}
