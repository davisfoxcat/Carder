//
//  PokerHands.swift
//  Carder
//
//  Created by LeeYu-De on 2015/7/30.
//  Copyright (c) 2015年 DavisLee. All rights reserved.
//

import Foundation

//包含判斷牌組
class PokerHands {
 
    private var partOfCards: [Card] = []  //判別用暫存牌組
    private var getCardNumer:Int  //張數
    
    //MARK:-count card suit number
    
    
    //MARK:- initial
    init(getCardNum:Int) {
        
        getCardNumer = getCardNum  //取得(getCardNum)張數
        
    }
    
    
    //MARK:- check Card
    func checkPokerHands() {
        
        partOfCards = deck.getCards(getCardNumer)
        partOfCards.sort{$0.rank < $1.rank}  //sort rank of partOfCards deck
        
        if self.findStraightFlush(partOfCards) == "StraightFlush" {
            println("This is StraightFlush")
        }else if self.findFourOfAKind(partOfCards) == "FourOfAKind" {
            println("This is FourOfAKind")
        }else if self.findFullHouse(partOfCards) == "FullHouse" {
            println("This is FullHouse")
        }else if self.findFlush(partOfCards) == "Flush" {
            println("This is Flush")
        }else if self.findStraight(partOfCards) == "Straight" {
            println("This is Straight")
        }
        
    }
    
    
    
    //MARK: - -check Card Method Implement-
    /*----------------------------------------------------------------------------------------*/
    //MARK:同花順
    private func findStraightFlush(partOfCards: [Card]) -> String {
        
        var PokerHandsType: String = ""  //牌組類型
        
        
        
        return PokerHandsType
    }
    
    //MARK:鐵支
    private func findFourOfAKind(partOfCards: [Card]) -> String {
        
        var PokerHandsType: String = ""  //牌組類型
        
        
        
        return PokerHandsType
    }
    
    //MARK:葫蘆
    private func findFullHouse(partOfCards: [Card]) -> String {
        
        var PokerHandsType: String = ""  //牌組類型
        
        
        
        
        return PokerHandsType
    }
    
    //MARK:同花
    private func findFlush(partOfCards: [Card]) -> String {
        
        var PokerHandsType: String = ""  //牌組類型
        var spadesCount:Int = 0
        var heartsCount:Int = 0
        var diamondsCount:Int = 0
        var clubsCount:Int = 0
        
        for partCard in partOfCards {
            switch partCard.suit {
                case "♠":
                    spadesCount++
                case "♡":
                    heartsCount++
                case "♢":
                    diamondsCount++
                case "♣":
                    clubsCount++
                default:
                    break
            }
        }
        
        if spadesCount == 5 ||
            heartsCount == 5 ||
            diamondsCount == 5 ||
            clubsCount == 5
        {
            PokerHandsType = "Flush"
        }else {
            PokerHandsType = ""
        }

        return PokerHandsType
    }
    
    //MARK:順子
    private func findStraight(partOfCards: [Card]) -> String {
        
        var PokerHandsType: String = ""  //牌組類型
        var isStraight: Bool = false
        
//        for var i = 1; i <= partOfCards.count; i++ {
//            if {
//                if (partOfCards[i-1].rank+1 == partOfCards[i].rank) {
//                    isStraight = true
//                }else {
//                    isStraight = false
//                }
//            
//                if isStraight == true {
//                    PokerHandsType = "Straight"
//                }
//            }
//            
//        }
        return PokerHandsType
    }
    /*----------------------------------------------------------------------------------------*/
    
    /***********************************************test Println the PartOfCard*/
    func testPrintlnPartOfCard() {
        println("")
        println("partOfCards:")
        for p in partOfCards {
            p.singleCardList()
        }
        println("partOfCards:\(partOfCards.count) p")
    }
    /***********************************************/

}
