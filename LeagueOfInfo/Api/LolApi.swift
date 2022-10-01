//
//  LolApi.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
//



import Alamofire
import PromiseKit
import SwiftyJSON


class LolApi {
    static func getChamps() -> Promise<[Champ]> {
        var champs: [Champ] = []
        
        //gestion de l'asyncrone, on retourne une promesse
        return Promise { seal in
            AF.request("http://ddragon.leagueoflegends.com/cdn/12.18.1/data/fr_FR/champion.json").response { response in
                let json = JSON(response.data as Any)
                //print(json)
                //print(json.dictionaryValue["data"]!.dictionaryValue.keys)
                
                for champName in  json.dictionaryValue["data"]!.dictionaryValue.keys{
                    
                    
                    //print (json.dictionaryValue["data"]?.dictionaryValue[champName]?["name"].stringValue)
                    
                    if let name = json.dictionaryValue["data"]?.dictionaryValue[champName]?["name"].stringValue , let titre  = json.dictionaryValue["data"]?.dictionaryValue[champName]?["title"].stringValue , let info = json.dictionaryValue["data"]?.dictionaryValue[champName]?["blurb"].stringValue, let stats = json.dictionaryValue["data"]?.dictionaryValue[champName]?.dictionaryValue["info"]?["attack"].stringValue,
                      let img =  json.dictionaryValue["data"]?.dictionaryValue[champName]?.dictionaryValue["image"]?["sprite"].stringValue{
                        champs.append(Champ(name: name,
                                            titre: titre,
                                            info: info,
                                            stats: stats,
                                            img: img
                                            
                                           )
                                      
                                      
                                      
                        )
                        seal.fulfill(champs)
                        
                        
                        
                    }
                    
                }
            }
        }
        
    }
}
