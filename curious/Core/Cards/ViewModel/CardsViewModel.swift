//
//  CardsViewModel.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    private let service: CardService
    
    init(service: CardService){
        self.service = service
        Task {await fetchCardModels()}
    }
    func fetchCardModels() async {
        do{
            self.cardModels = try await service.fetchCardModels()
        } catch{
            print("DEBUG: Failed to fetch cartds with error: \(error)")
        }
    }
    
    func removeCard(_ card: CardModel){
        guard let index = cardModels.firstIndex(where: {$0.id == card.id}) else{return}
        cardModels.remove(at: index)
    }
}


