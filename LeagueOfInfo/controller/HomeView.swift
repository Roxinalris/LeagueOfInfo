//
//  HomeView.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 01/10/2022.
//

import Foundation
import UIKit
import AVKit
class HomeView : UIViewController {
    
    var player: AVAudioPlayer?

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var texts: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var mat: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.img.image = UIImage(named: "League_of_Legends_Logo.png" )
        self.mat.image = UIImage(named: "Matrix.jpg")
        self.text.text = "à droite un chemin vertueux "
        self.texts.text = "à gauche une démence assurée"
        playSound()
     
        
        
    }
    func playSound() {
        guard  let url = Bundle.main.url(forResource: "videoplayback", withExtension: ".mp4") else {return}
        
        
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch{
            print("Erreur: fichier impossible a lire")
        }
       
    }
}
