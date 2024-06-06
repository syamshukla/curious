//
//  UserInfoView.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI

struct CardInfoView: View {
    @ObservedObject var viewModel: CardsViewModel
    let fact: FactModel

    var body: some View {
        VStack {
            HStack {
                Text("Curious Fact")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(UIColor.systemBackground))
            }
            .foregroundStyle(.white)
            .padding()

            Text(fact.text) // Display the fact text
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}


// New ViewModel for CardInfoView
class CardInfoViewModel: ObservableObject {
    @Published var fact: FactModel?

    let apiHelper = GeminiAPIHelper()

    func fetchFact() {
        apiHelper.fetchFacts { facts, error in
            if let facts = facts, !facts.isEmpty {
                DispatchQueue.main.async {
                    self.fact = facts[0] // Get the first fact (or choose randomly)
                }
            } else if let error = error {
                // Handle the error (e.g., display an error message in the view)
                print("Error fetching fact: \(error)")
            }
        }
    }
}

struct CardInfoView_Previews: PreviewProvider {
    static var previews: some View {
        // Sample data for the preview
        let fact = FactModel(text: "This is a sample fact.")
        let cardModel = CardModel(facts: [fact])

        NavigationView {
            CardInfoView(viewModel: CardsViewModel(service: CardService()), fact: fact)
        }
    }
}
