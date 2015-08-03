//
//  card.swift
//  Carder
//
//  Created by LeeYu-De on 2015/7/18.
//  Copyright (c) 2015年 DavisLee. All rights reserved.
//

import Foundation

/*----------------------------------------------------------------------------------------*/

class Card{   //卡牌本身在初始化沒有花色階級
    
    var suit:String = ""   // 花色
    var rank:Int = 0   // 階級
    
    //MARK:- 用card(String, r: String)初始化 suit花色, rank階級
    init(s: String, r: Int){
        suit = s
        rank = r
    }
    
    //MARK:- 印牌面
    func singleCardList(){
       //印自己卡面
        println("\(suit) \(rank)")
    }
    
}


