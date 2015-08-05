//
//  Enums.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-08-04.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation

class Enums {

    enum Age: Int, Printable {
        case UnderSixteen = 0
        case SixteenToTwenty = 1
        case TwentyToTwentyFive = 2
        case TwentyFiveToThirty = 3
        case ThirtyfiveToFourty = 4
        case FourtyToFifty = 5
        case OverFifty = 6
        static var count: Int { return Age.OverFifty.hashValue + 1 }
        
        var description: String {
            switch self {
            case .UnderSixteen : return "< 16"
            case .SixteenToTwenty : return "16 - 20"
            case .TwentyToTwentyFive  : return "20 - 25"
            case .TwentyFiveToThirty : return "25 - 30"
            case .ThirtyfiveToFourty : return "30 - 35"
            case .FourtyToFifty : return "40 - 50"
            case .OverFifty : return "> 50"
            default: return ""
            }
        }
    }
    
    var heightFeetOptions = ["4 feet","5 feet","6 feet","7 feet","8 feet"]
    
    enum HeightFeet: Int, Printable {
        case Four = 0
        case Five = 1
        case Six = 2
        case Seven = 3
        static var count: Int { return HeightFeet.Seven.hashValue + 1 }
        
        var description: String {
            switch self {
            case .Four : return "4 feet"
            case .Five : return "5 feet"
            case .Six  : return "6 feet"
            case .Seven : return "7 feet"
            default: return ""
            }
        }
    }
    
    enum HeightInches: Int, Printable {
        case One = 0
        case Two = 1
        case Three = 2
        case Four = 3
        case Five = 4
        case Six = 5
        case Seven = 6
        case Eight = 7
        case Nine = 8
        case Ten = 9
        case Eleven = 10
        static var count: Int { return HeightInches.Eleven.hashValue + 1 }
        
        var description: String {
            switch self {
            case .One : return "1 inch"
            case .Two : return "2 inches"
            case .Three  : return "3 inches"
            case .Four : return "4 inches"
            case .Five : return "5 inches"
            case .Six : return "6 inches"
            case .Seven : return "7 inches"
            case .Eight : return "8 inches"
            case .Nine : return "9 inches"
            case .Ten : return "10 inches"
            case .Eleven : return "1 inches"
            default: return ""
            }
        }
    }
    
    enum Weight: Int, Printable {
        case UnderOne = 0
        case OneToOneThirty = 1
        case OneThirtyToOneFifty = 2
        case OneFiftyToOneEighty = 3
        case OneEightyToTwo = 4
        case OverTwo = 5
        static var count: Int { return Weight.OverTwo.hashValue + 1 }
        
        var description: String {
            switch self {
            case .UnderOne : return "< 100"
            case .OneToOneThirty : return "100 - 130"
            case .OneThirtyToOneFifty  : return "130 - 150"
            case .OneFiftyToOneEighty : return "150 - 180"
            case .OneEightyToTwo : return "180 - 200"
            case .OverTwo : return "> 200"
            default: return ""
            }
        }
    }
    
    enum TimesPerWeek: Int, Printable {
        case One = 0
        case Two = 1
        case Three = 2
        case Four = 3
        case Five = 4
        case Six = 5
        case Seven = 6
        static var count: Int { return TimesPerWeek.Seven.hashValue + 1 }
        
        var description: String {
            switch self {
            case .One : return "One"
            case .Two : return "Two"
            case .Three  : return "Three"
            case .Four : return "Four"
            case .Five : return "Five"
            case .Six : return "Six"
            case .Seven : return "Seven"
            default: return ""
            }
        }
    }

    enum Goals: Int, Printable {
        case LoseFat = 0
        case GainMuscle = 1
        static var count: Int { return Goals.GainMuscle.hashValue + 1 }
        
        var description: String {
            switch self {
            case .LoseFat : return "Lose Fat"
            case .GainMuscle : return "Gain Muscle"
            default: return ""
            }
        }
    }

}
