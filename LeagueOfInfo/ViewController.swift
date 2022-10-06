//
//  ViewController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var item_name: UILabel!
    @IBOutlet weak var descriptionChamp: UILabel!
    @IBOutlet weak var nameChamp: UILabel!
    @IBOutlet weak var titleChamp: UILabel!
    @IBOutlet weak var img: UIImageView!
    var champs: [Champ] = []
    var items: [Item] = []
    var i : Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.descriptionChamp.text = "champ.info"
        self.nameChamp.text = "champ.name"
        self.titleChamp.text = "champ.titre"
        
        self.img.image =  UIImage(named: "League_of_Legends_Logo.png" )
        
        print("LauchCall")
        self.getChamps()
        self.getItem()
        
    }
    
    
    func getItem() {
        LolApi.getItem().done {items in
            self.items = items
            print(items)
           // let i = Int.random(in:0...items.count-1)
   
            self.item_name.text = self.i?.name
            
        }
    }
    
    func getChamps() {
        LolApi.getChamps().done {champs in
            self.champs = champs
            
            print("champs : \(champs.count)")
            
            let champ = champs[Int.random(in:0...champs.count - 1)]
           
           /* if let champUrl = self.c?.img {
                if let url = URL(string: champUrl), let imgData = try? Data(contentsOf: url){
                    let image = UIImage(data: imgData)
                    self.img.image = image
                }
            }*/
            
            
            print(champ.info)
            print(champ.name)
            print(champ.titre)
            
            self.descriptionChamp.text = champ.info
            self.nameChamp.text = champ.name
            self.titleChamp.text = champ.titre
            //self.attackchamp.text = self.c?.stats
           // self.img.image = UIImage(named: self.c!.img)
            /*LolApi.getItem().done {items in
                self.items = items
                
               
                
                //self.item_name.text = self.i?.name
                
            }*/
        
            print("EndCall")
            
        }
        
        }



}

