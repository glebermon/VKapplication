//
//  FriendListTableViewController.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class FriendListController: UITableViewController {
    
    var friends: [Friend] = Generator.createFriendList()
    @IBOutlet var friendTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendCell

        cell.configureCell(friend: friends[indexPath.row])

        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Проверка на правильный индентификатор segue
        guard segue.identifier != "selectHuman" else {
            let destination = segue.destination as! FriendPhotoCollection
            guard let indexPath = self.friendTable.indexPathForSelectedRow else {return}
            destination.friend.append(self.friends[indexPath.row])
            return
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "selectHuman",sender: nil)
    }
    
    func charSelected(buttonValue: String) {
        //
    }
}
