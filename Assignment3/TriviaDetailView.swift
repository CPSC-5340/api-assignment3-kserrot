//
//  TriviaDetailView.swift
//  Assignment3
//
//  Created by Kaique Torres on 3/31/24.
//

import SwiftUI

struct TriviaDetailView: View {
    var triviaQuestion: TriviaQuestion
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Question: \(triviaQuestion.question)")
                .bold()
            Text("Answer: \(triviaQuestion.correctAnswer)")
            Text("Difficulty: \(triviaQuestion.difficulty.capitalized)")
            Spacer()
        }
        .padding()
        .navigationTitle(triviaQuestion.category)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TriviaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTriviaQuestion = TriviaQuestion(
            category: "Animals",
            type: "boolean",
            difficulty: "easy",
            question: "Cats have whiskers under their legs.",
            correctAnswer: "True",
            incorrectAnswers: ["False"]
        )
        TriviaDetailView(triviaQuestion: sampleTriviaQuestion)
    }
}
