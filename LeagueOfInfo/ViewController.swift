//
//  ViewController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var position: UIImageView!
    @IBOutlet weak var img_item_1: UIImageView!
    @IBOutlet weak var img_item_2: UIImageView!
    @IBOutlet weak var img_item_3: UIImageView!
    @IBOutlet weak var img_item_4: UIImageView!
    @IBOutlet weak var img_item_5: UIImageView!
    @IBOutlet weak var img_item_6: UIImageView!
    @IBOutlet weak var itemCame: UILabel!
    @IBOutlet weak var item_name_3: UILabel!
    @IBOutlet weak var item_name_2: UILabel!
    @IBOutlet weak var item_name_4: UILabel!
    @IBOutlet weak var item_name_5: UILabel!
    @IBOutlet weak var item_name_6: UILabel!
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
        
   
      /*  self.nameChamp.text = "champ.name"
        self.titleChamp.text = "champ.titre"
        self.itemCame.text = "item"
        
        self.img.image =  UIImage(named: "League_of_Legends_Logo.png" )
        self.img_item_1.image = UIImage(named: "League_of_Legends_Logo.png")*/
        
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
            
            
            //print(champ.info)
            print(champ.name)
            print(champ.titre)
            
            //self.descriptionChamp.text = champ.info
            self.nameChamp.text = champ.name
            self.titleChamp.text = champ.titre
            
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(champ.name)_0.jpg"), let imgData = try? Data(contentsOf: url){
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
           
            var i = items[Int.random(in:0...items.count-1)]
            var i1 = items[Int.random(in:0...items.count-1)]
            var i2 = items[Int.random(in:0...items.count-1)]
            var i3 = items[Int.random(in:0...items.count-1)]
            var i4 = items[Int.random(in:0...items.count-1)]
            var i5 = items[Int.random(in:0...items.count-1)]
            var bool : Bool = false
            while bool == false{
                if(i.name == i1.name || i.name == i2.name || i.name == i3.name || i.name == i4.name || i.name == i5.name || i1.name == i2.name  || i1.name == i3.name || i1.name == i4.name || i1.name == i5.name || i2.name == i3.name || i2.name == i4.name || i2.name == i5.name || i3.name == i4.name || i3.name == i5.name || i4.name == i5.name || i.purchasable == false || i1.purchasable == false || i2.purchasable == false || i3.purchasable == false || i4.purchasable == false || i5.purchasable == false){
                    i = items[Int.random(in:0...items.count-1)]
                    i1 = items[Int.random(in:0...items.count-1)]
                    i2 = items[Int.random(in:0...items.count-1)]
                    i3 = items[Int.random(in:0...items.count-1)]
                    i4 = items[Int.random(in:0...items.count-1)]
                    i5 = items[Int.random(in:0...items.count-1)]
                    print("if")
                    
                }else{
                    print("else")
                    bool = true
                }
                
            }
            print(i.name)
            print(i1.name)
            print(i2.name)
            print(i3.name)
            print(i4.name)
            print(i5.name)
            self.itemCame.text = i.name
            self.item_name_2.text = i1.name
            self.item_name_3.text = i2.name
            self.item_name_4.text = i3.name
            self.item_name_5.text = i4.name
            self.item_name_6.text = i5.name
            
            
            
         
            
            print(i.id)
            print(i1.id)
            print(i2.id)
            print(i3.id)
            print(i4.id)
            print(i5.id)
            
            
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i.id).png"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img_item_1.image = image
                    
            }
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i1.id).png"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img_item_2.image = image
                
            }
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i2.id).png"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img_item_3.image = image
                
            }
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i3.id).png"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img_item_4.image = image
                
            }
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i4.id).png"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img_item_5.image = image
                
            }
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/item/\(i5.id).png"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.img_item_6.image = image
                
            }
            
            self.getposition()
            
            //image.image = UIImage(named: "\(Int.random(in:0...100)%2).jpg")
            //if (Int.random(in: 0...100)%2 == 1){
               // self.nom.text = "morty"
                
            //}else{
               // self.nom.text = "rick"
        }
    }
    
    func getposition(){
        let i = Int.random(in:1...5 )
        self.position.image =  UIImage(named: "Position_Gold-\(i).png" )
    }
    



}

