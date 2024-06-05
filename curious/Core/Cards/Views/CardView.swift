//
//  CardView.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    
    @State private var degrees: Double = 0
    
    let model: CardModel
    var body: some View {
        ZStack(){
            ZStack(alignment:.top){
                RoundedRectangle(cornerRadius: 10)
                    .fill(.primary)  // Set the background color to .secondary
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            CardInfoView( user:user)
                .padding(.horizontal)
        }

        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onRecieveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView{
    var user: UserModel{
        return model.user
    }
    
    
}
private extension CardView{
    func returnToCenter(){
        xOffset = 0
        degrees = 0
    }
    func swipeRight(){
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {viewModel.removeCard(
            model
        )
        }
    }
    func swipeLeft(){
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {viewModel.removeCard(
            model
        )
        }
    }
    func onRecieveSwipeAction(_ action: SwipeAction?){
        guard let action else {return}
        let topCard = viewModel.cardModels.last
        if topCard == model{
            switch action{
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
    
}
private extension CardView{
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degrees = Double(value.translation.width/25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        if width >= SizeConstants.screenCutoff{
            swipeRight()
        }
        else{
            swipeLeft()
        }
    }
}

#Preview {
    CardView(
        viewModel: CardsViewModel(
            service:CardService()
        ),
        model:CardModel(
            user: MockData.users[0]
        )
    )
}
