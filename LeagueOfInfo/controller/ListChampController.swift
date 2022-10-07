//
//  ListChampController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 01/10/2022.
//

import Foundation
import UIKit
class ListChampController :  UITableViewController  {
    
    var champs : [Champ] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LolApi.getChamps().done {champs in
            self.champs = champs
            
        }
       
        
        
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champs.count - 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ListChampController")
            if indexPath.section == 0 {
                let champ = champs[indexPath.row]
                cell.textLabel?.text = champ.name
            } else {
                let champ = champs[indexPath.row + (champs.count / numberOfSections(in: tableView)) * indexPath.section]
                cell.textLabel?.text = champ.name
            }
        
        return cell
    }
/*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var champ = champs[indexPath.row]
        let numberOfSection = numberOfSections(in: tableView)
        

        print(indexPath.row + (champs.count / numberOfSection))
        
        if indexPath.section != 0 {
            champ = champs[indexPath.row + (champs.count / numberOfSection) * indexPath.section]
        }
        
        let viewController = ChampViewController(frame: tableView.frame, champ: champ)
        
        navigationController?.pushViewController(viewController, animated: true)
    }*/
}
