//
//  NewGroupTableViewController.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class NewGroupController: UITableViewController, UISearchBarDelegate {
    
    var fullGroupList: [Group] = [Group]()
    var groups: [Group] = [Group]()

    @IBOutlet var table: UITableView!
    @IBOutlet weak var search: GroupSearch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = fullGroupList
        search.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath) as! NewGroupCell
        
        cell.configureCell(group: groups[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "returnGroup", sender: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterGroupList(text: searchBar.text ?? "")
    }
    
    func filterGroupList(text: String) {
        //Исключение для пустого поиска
        guard text != "" else {
            groups = fullGroupList
            table.reloadData()
            return
        }
        var newGroupList: [Group] = [Group]()
        for group in fullGroupList {
            if group.name.contains(text) {
                newGroupList.append(group)
            }
        }
        groups = newGroupList
        table.reloadData()
    }
}
