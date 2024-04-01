//
//  TriviaViewModel.swift
//  Assignment3
//
//  Created by Kaique Torres on 3/31/24.
//

import Foundation

import Combine

class TriviaViewModel: ObservableObject {
    
    @Published var triviaQuestions: [TriviaQuestion] = []
    @Published var currentQuestionIndex = 0
    
    private var cancellables = Set<AnyCancellable>()

    func fetchTriviaQuestions() {
        let urlString = "https://opentdb.com/api.php?amount=10&category=27&difficulty=easy&type=boolean"
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: TriviaResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching trivia questions: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.triviaQuestions = response.results
                self?.currentQuestionIndex = 0
            })
            .store(in: &cancellables)
    }
    
    func checkAnswer(userAnswer: String) {
        let currentQuestion = triviaQuestions[currentQuestionIndex]
        if userAnswer == currentQuestion.correctAnswer {
            nextQuestion()
        } else {
    
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex + 1 < triviaQuestions.count {
            currentQuestionIndex += 1
        } else {
            print("Quiz completed")
            currentQuestionIndex = 0
        }
    }
}
    
