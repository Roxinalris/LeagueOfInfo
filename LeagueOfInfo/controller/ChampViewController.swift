//
//  ChampViewController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 07/10/2022.
//

import Foundation
import UIKit
class ChampViewController: UIViewController{
    
    
    @IBOutlet weak var name_champ: UILabel!
    @IBOutlet weak var sprit_champ: UIImageView!
    @IBOutlet weak var title_champ: UILabel!
    
    @IBOutlet weak var desc_champ: UILabel!
    var champ: Champ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let safeChamp = self.champ {
            name_champ.text = safeChamp.name
            title_champ.text = safeChamp.titre
            if let url = URL(string: "http://ddragon.leagueoflegends.com/cdn/img/champion/loading/\(safeChamp.name)_0.jpg"), let imgData = try? Data(contentsOf: url){
                let image = UIImage(data: imgData)
                self.sprit_champ.image = image
            }
            desc_champ.text = safeChamp.desc
        }
       
              
    }
   
}

/*extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}


let rootViewController = ChampViewController()
rootViewController.title = "Pokedex"

let navigationController = UINavigationController(rootViewController: rootViewController)
PlaygroundPage.current.liveView = navigationController.view*/
