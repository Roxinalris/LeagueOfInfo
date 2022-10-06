//
//  ViewController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var img_item_1: UIImageView!
    @IBOutlet weak var itemCame: UILabel!
    @IBOutlet weak var descriptionChamp: UILabel!
    @IBOutlet weak var nameChamp: UILabel!
    @IBOutlet weak var titleChamp: UILabel!
    @IBOutlet weak var img: UIImageView!
    var champs: [Champ] = []
    var items: [Item] = []
    var i : Item?
    
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        var _isLoading: Bool = false
        
        self.descriptionChamp.text = "champ.info"
        self.nameChamp.text = "champ.name"
        self.titleChamp.text = "champ.titre"
        self.itemCame.text = "item"
        
        self.img.image =  UIImage(named: "League_of_Legends_Logo.png" )
        self.img_item_1.image = UIImage(named: "League_of_Legends_Logo.png")
        
        print("LauchCall")
        self.getChamps()
        self.getItem()
        super.viewDidLoad()
        
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
            
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(champ.name)_0.jpg"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img.image = image
            }
            
            //self.attackchamp.text = self.c?.stats
           // self.img.image = UIImage(named: self.c!.img)
            /*LolApi.getItem().done {items in
                self.items = items
                
               
                
                //self.item_name.text = self.i?.name
                
            }*/
        
            print("EndCall")
            
        }
        
        }
    func getItem() {
        LolApi.getItem().done {items in
            self.items = items
           
            let i = items[Int.random(in:0...items.count-1)]
            print(i.name)
            self.itemCame.text = i.name
            
         
            
            
            
            
                if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i.id).png"), let imgData = try? Data(contentsOf: url){
                    let image = UIImage(data: imgData)
                    self.img_item_1.image = image
                }
            
            
            
            //image.image = UIImage(named: "\(Int.random(in:0...100)%2).jpg")
            //if (Int.random(in: 0...100)%2 == 1){
               // self.nom.text = "morty"
                
            //}else{
               // self.nom.text = "rick"
        }
    }
    



}

