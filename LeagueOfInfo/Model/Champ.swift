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

    var stats :String
    var img : String
    var desc : String
    
    init(name : String, titre: String, stats : String, img : String, dsc : String){
        
        self.name = name
    
        self.titre = titre
        self.stats = stats
        self.img = img
        self.desc = dsc
        
    }
}
