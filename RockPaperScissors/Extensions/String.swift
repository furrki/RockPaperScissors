//
//  String.swift
//  RockPaperScissors
//
//  Created by Admin on 19.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

extension String {
    var byWords: [String] {
        var byWords:[String] = []
        enumerateSubstrings(in: startIndex..<endIndex, options: .byWords) {
            guard let word = $0 else { return }
            print($1,$2,$3)
            byWords.append(word)
        }
        return byWords
    }
    var lastWord: String {
        return byWords.last ?? ""
    }
}
