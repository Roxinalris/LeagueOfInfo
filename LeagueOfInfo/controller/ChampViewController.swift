//
//  ChampViewController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 07/10/2022.
//

import Foundation
import UIKit
class ChampViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()       
    }
    private let champ: Champ
    
    // initialisation d'une vue à la volé
    init(frame: CGRect, champ: Champ) {
        self.champ = champ
        super.init(nibName: nil, bundle: nil)
        
        self.title = self.champ.name
        self.view = UIView(frame: frame)
        self.view.backgroundColor = UIColor.random
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}


//let rootViewController = ChampViewController()
//rootViewController.title = "Pokedex"

//let navigationController = UINavigationController(rootViewController: rootViewController)
//PlaygroundPage.current.liveView = navigationController.view
