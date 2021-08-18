//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Amir Bakhshi on 2021-08-17.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

 struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.rightAnswer = correctAnswer
    }
}
