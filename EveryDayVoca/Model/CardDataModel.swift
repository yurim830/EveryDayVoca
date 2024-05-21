//
//  CardDataModel.swift
//  EveryDayVoca
//
//  Created by 배지해 on 5/19/24.
//

import Foundation

struct CardDataModel {
    
    var word : String
    var meaning : String
    var status : status
    
    init(word: String, meaning: String, status: status) {
        self.word = word
        self.meaning = meaning
        self.status = status
    }
}

enum status: String {
    case memorized = "외웠어요"
    case ambiguous = "애매해요"
    case difficult = "어려워요"
    case none = "미학습"
}
