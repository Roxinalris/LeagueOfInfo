//
//  LolApi.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
//



import Alamofire
import PromiseKit
import SwiftyJSON
import CoreFoundation


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
                    
                    if let name = json.dictionaryValue["data"]?.dictionaryValue[champName]?["name"].stringValue , let titre  = json.dictionaryValue["data"]?.dictionaryValue[champName]?["title"].stringValue , let stats = json.dictionaryValue["data"]?.dictionaryValue[champName]?.dictionaryValue["info"]?["attack"].stringValue,
                      let img =  json.dictionaryValue["data"]?.dictionaryValue[champName]?.dictionaryValue["image"]?["sprite"].stringValue,
                    let dsc = json.dictionaryValue["data"]?.dictionaryValue[champName]?.dictionaryValue["blurb"]?.stringValue{
                        champs.append(Champ(name: name,
                                            titre: titre,
                                         
                                            stats: stats,
                                            img: img,
                                            dsc: dsc
                                            
                                           )
                                      
                                      
                                      
                        )
                        
                        
                        
                        
                    }
                    
                    
                }
                seal.fulfill(champs)
            }
        }
        
    }
    static func getItem() -> Promise<[Item]> {
        var items: [Item] = []
        return Promise { seal in
            AF.request("http://ddragon.leagueoflegends.com/cdn/12.19.1/data/fr_FR/item.json").response { response in
                let json = JSON(response.data as Any)

                for item in json.dictionaryValue["data"]!.dictionaryValue.keys{
                    
                    if let name = json.dictionaryValue["data"]?.dictionaryValue[item]?["name"].stringValue, let purchasable = json.dictionaryValue["data"]?.dictionaryValue[item]?.dictionaryValue["gold"]?.dictionaryValue["purchasable"]?.boolValue{
                       items.append(Item(name: name,
                                         id: item ,
                                         purchasable: purchasable
                            
                                    ))
                    
                       
                    }
                }
                seal.fulfill(items)}
            }
            
        
    }
}
