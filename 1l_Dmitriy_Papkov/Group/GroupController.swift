//
//  GroupTableViewController.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class GroupController: UITableViewController {
    
    @IBOutlet var groupTable: UITableView!
    var groupList: [Group] = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupCell

        cell.configureCell(group: groupList[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groupList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addGroup(sender: UIStoryboardSegue) {
        guard sender.identifier == "returnGroup" else {return}
        let newGroupController = sender.source as! NewGroupController
        guard let indexPath = newGroupController.table.indexPathForSelectedRow else {return}
        let group = newGroupController.groups[indexPath.row]
        groupList.append(group)
        groupTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != "newGroup" else {
            let destenation = segue.destination as! NewGroupController
            destenation.fullGroupList = Generator.setNewGroupsList(exclude: groupList)
            return
        }
    }
}
