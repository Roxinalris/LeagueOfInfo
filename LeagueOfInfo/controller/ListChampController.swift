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
        LolApi.getChamps().done {champs in
            self.champs = champs
        }
       
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champs.count - 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ListChampController")
        
        return cell
    }
}
