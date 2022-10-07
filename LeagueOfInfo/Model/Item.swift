//
//  Item.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 06/10/2022.
//

import Foundation
class Item{
    
    var name : String
    var id : String
    var purchasable : Bool

    
    init(name : String, id :String, purchasable :Bool){
        self.name = name
        self.id = id
        self.purchasable = purchasable
     
    
        
    }
}
