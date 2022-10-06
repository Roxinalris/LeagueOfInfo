//
//  Champ.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
//

import Foundation

class Champ{
    
    var name : String
    var titre : String
    var info : String
    var stats :String
    var img : String
    
    init(name : String, titre: String, info : String, stats : String, img : String){
        
        self.name = name
        self.info = info
        self.titre = titre
        self.stats = stats
        self.img = img
        
    }
}
