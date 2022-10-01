//
//  HomeView.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 01/10/2022.
//

import Foundation
import UIKit

class HomeView : UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.img.image = UIImage(named: "League_of_Legends_Logo.png" )
    
        
    }
}
