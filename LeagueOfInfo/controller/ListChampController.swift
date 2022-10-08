//
//  ListChampController.swift
//  LeagueOfInfo
//
//  Created by Lucas Ferrauto on 01/10/2022.
//

import Foundation
import UIKit
class ListChampController :  UITableViewController  {
    
    @IBOutlet weak var searchChamp: UISearchBar!
    var champ : Champ? = nil
    var champs : [Champ] = []
    var filterData : [Champ]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchChamp.delegate = self
        self.title = "Champion List"
        refreshChampList()
        }
       
    func refreshChampList() {
            self.champs.removeAll()
            LolApi.getChamps().done {champs in
                self.champs = champs
                self.tableView.reloadData()
                self.filterData = champs
            }
        }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section \(section)"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterData?.count  ?? champs.count - 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ListChampController")
            if indexPath.section == 0 {
                //let champ = champs[indexPath.row]
                cell.textLabel?.text = filterData?[indexPath.row].name ?? champs[indexPath.row].name//champ.name
            } else {
                let champ = champs[indexPath.row + (champs.count / numberOfSections(in: tableView)) * indexPath.section]
                cell.textLabel?.text = filterData?[indexPath.row].name
                
            }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "listToChampion", sender: filterData?[indexPath.row] ?? champs[indexPath.row])
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listToChampion" {
            if let destination = segue.destination as? ChampViewController, let safeChamp = sender as? Champ {
                destination.champ = safeChamp
            }
        }
    }
}
extension ListChampController :UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText : String) {
        filterData = []
        print(searchText)
        if searchText == "" {
            filterData = champs
        }
        for champ in champs
        {
            if champ.name.uppercased().contains(searchText.uppercased())
            {
                filterData?.append(champ)
            }
            self.tableView.reloadData()
        }
    }
}
