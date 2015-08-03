//
//  main.swift
//  Cards
//
//  Created by LeeYu-De on 2015/8/3.
//  Copyright (c) 2015年 DavisLee. All rights reserved.
//

import Foundation


var deck:Deck = Deck()

deck.randomCards(100)    //洗 x 次牌
deck.listCards()    //list all card if no Parameter
println("")
deck.listCards(5)   //印 x 張牌
//deck.listCards()    //list all card if no Parameter

var pokerHands:PokerHands = PokerHands(getCardNum: 5)  //預設5張


pokerHands.checkPokerHands()
pokerHands.testPrintlnPartOfCard()  //test Println the PartOfCard
