//
//  ViewController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 30/09/2022.
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var descriptionChamp: UILabel!
    @IBOutlet weak var nameChamp: UILabel!
    @IBOutlet weak var titleChamp: UILabel!
    @IBOutlet weak var img: UIImageView!
    var champs: [Champ] = []
    var c : Champ?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LolApi.getChamps().done {champs in
            self.champs = champs
            print(self.champs)
            self.c = champs[Int.random(in:0...champs.count - 1)]
           
           /* if let champUrl = self.c?.img {
                if let url = URL(string: champUrl), let imgData = try? Data(contentsOf: url){
                    let image = UIImage(data: imgData)
                    self.img.image = image
                }
            }*/
            
            self.descriptionChamp.text = self.c?.info
            self.nameChamp.text = self.c?.name
            self.titleChamp.text = self.c?.titre
            //self.attackchamp.text = self.c?.stats
           // self.img.image = UIImage(named: self.c!.img)
            
        }
        
    }


}

