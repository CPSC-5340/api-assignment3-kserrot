//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct TriviaView: View {
    @StateObject var viewModel = TriviaViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.triviaQuestions.isEmpty {
                    Text("Loading questions...")
                        .padding()
                } else {
                    let question = viewModel.triviaQuestions[viewModel.currentQuestionIndex]
                    Text(question.question)
                        .padding()
                    HStack {
                        Button("True") {
                            viewModel.checkAnswer(userAnswer: "True")
                        }
                        Button("False") {
                            viewModel.checkAnswer(userAnswer: "False")
                        }
                    }
                }
            }
            .navigationTitle("Trivia Question \(viewModel.currentQuestionIndex + 1)/\(viewModel.triviaQuestions.count)")
            .onAppear {
                viewModel.fetchTriviaQuestions()
            }
        }
    }
}

struct TriviaListView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
