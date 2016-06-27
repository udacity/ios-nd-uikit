//
//  RPS
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation

// The RPS enum represents a move.

enum RPS {
    case Rock, Paper, Scissors

    // The init method randomly generates the opponent's move
    init() {
        switch arc4random() % 3 {
        
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
    }

    // The defeats method defines the hierarchy of moves, Rock defeats Scissors etc. 
    func defeats(opponent: RPS) -> Bool {
        switch (self, opponent) {
        case (.Paper, .Rock), (.Scissors, .Paper), (.Rock, .Scissors):
            return true;
        default:
            return false;
        }
    }
}

extension RPS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case .Scissors:
                return "Scissors"
            }
        }
    }
}

