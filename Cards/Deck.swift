//
//  Deck.swift
//  Carder
//
//  Created by LeeYu-De on 2015/7/22.
//  Copyright (c) 2015年 D/Users/david/Documents/Git/-Practice-/Carder (1)/Carder/Deck.swiftavisLee. All rights reserved.
//

import Foundation

class Deck {
    private static let shardDeck = Deck()
        
    var cardDeck:[Card]
    
    //MARK:- 花色
    private let suitValue:[String] =
        ["♠",  //Spades   0
        "♡",  //Hearts    1
        "♢",  //Diamonds  2
        "♣"]  //Clubs     3
    
    //MARK:階級
    private let rankValue:[Int] =
    [1,2,3,4,5,6,7,8,9,10,11,12,13]
    
//    private let rankValue:[String] =
//        ["Ace",
//        "-2-",
//        "-3-",
//        "-4-",
//        "-5-",
//        "-6-",
//        "-7-",
//        "-8-",
//        "-9-",
//        "-10-",
//        "Jack",
//        "Queen",
//        "King"]
    
    
    //MARK:- 初始化卡牌
    init() {
        /*
        1. 清空cardDeck確保不會有兩副牌組塞在一起
        2. 用suitValue與rankValue兩個陣列產生Card物件
        3. 把Card物件加入cardDeck，繼續回到步驟2直到所有Card產生完畢
        */
        
        cardDeck = []
        
        for s in 0..<suitValue.count {
            for r in 0..<rankValue.count {
                self.cardDeck.append(Card(s: suitValue[s], r: rankValue[r]))
            }
        }
        for s in 0..<2{  //添加2張鬼牌
            self.cardDeck.append(Card(s: "\u{1F0CF}", r: 0))
        }
    }
    
    //MARK: 取得指定張數卡牌(從cardDeck頭開始抽)
    func getCards(getNum:Int) -> [Card] {
        var tmpDeck:[Card] = []
        for gNum in 0..<getNum {
            tmpDeck.append(self.cardDeck[gNum])
        }
        return tmpDeck
    }
    
    //MARK: 列全部卡牌(照順序)
    func listCards() {
        for c in cardDeck {
            c.singleCardList()
        }        
    }
    
    //MARK: 指定印幾張(從頭)
    func listCards(num:Int) {
        for c in 0..<num {
            cardDeck[c].singleCardList()
        }
    }
    
    //MARK:- 洗牌（整副）,參數用於洗幾次牌
    func randomCards(round: Int) {
        /*------------------------------------------------------------------------------------------        
        0 <= cardX1 <= cardX2 <= cardDeck.count
        cardX1 <= distance <= cardDeck.count/2
        ------------------------------------------------------------------------------------------*/
        var cardX1: Int = 0
        var distance: Int = 0
        var cardX2: Int = 0
        var cardTmpDeck:[Card] = []   //用於重組cardDeck用（暫時的）
        /*----------------------------------------------------------------------------------------*/
        for xx in 0..<round
        {
            cardTmpDeck = []
            
            do{
            cardX1 = Int(arc4random_uniform(UInt32(cardDeck.count-1)))+1   //cardX1 = 1~cardDeck.count-1  //arc4random_uniform內參數要UInt32
            distance = Int(arc4random_uniform(UInt32(cardDeck.count)))  //distance = 0~(cardDeck.count)
            cardX2 = (cardX1 + distance) % cardDeck.count   //cardX1 <= cardX2 <= cardDeck.count
            }while(cardX1 > cardX2)
         
            for bSection in cardX1...cardX2 {   //將"選中的區段"暫時填裝到用於重組cardDeck的cardTmpDeck
                cardTmpDeck.append(cardDeck[bSection])
            }
            for bSection in cardX1...cardX2 {    //把原來在cardDeck中的"選中的區段"
                cardDeck.removeAtIndex(cardX1)
            }            
            for i in cardTmpDeck.reverse() {     //將"選中的區段"從cardTmpDeck塞回到cardDeck的最前面
                cardDeck.insert(i, atIndex: 0)
            }            
        }
    }
}



