//
//  TriviaModel.swift
//  Assignment3
//
//  Created by Kaique Torres on 3/31/24.
//

import Foundation

struct TriviaResponse: Codable {
    let responseCode: Int
    let results: [TriviaQuestion]
    
    enum CodingKeys: String, CodingKey {
            case responseCode = "response_code"
            case results
        }
    }


struct TriviaQuestion: Codable, Identifiable {
    let id = UUID()
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question, correctAnswer = "correct_answer", incorrectAnswers = "incorrect_answers"
    }
}
