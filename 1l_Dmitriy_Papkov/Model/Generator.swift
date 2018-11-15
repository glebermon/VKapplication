//
//  Generator.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 08/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import Foundation

class Generator {
    static func setNewGroupsList(exclude: [Group]) -> [Group] {
        var groups: [Group] = [Group]()
        groups.append(Group.init(name: "Группа 1", image: "group_1"))
        groups.append(Group.init(name: "Группа 2", image: "group_2"))
        groups.append(Group.init(name: "Группа 3", image: "group_3"))
        groups.append(Group.init(name: "Группа 4", image: "group_4"))
        groups.append(Group.init(name: "Группа 5", image: "group_5"))
        for item in exclude {
            for (num, group) in groups.enumerated() {
                if group.name == item.name {
                    groups.remove(at: num)
                }
            }
        }
        return groups
    }
    static func createFriendList() -> [Friend] {
        var friends: [Friend] = [Friend]()
        friends.append(Friend.init(firstName: "Имя 1", lastName: "Фамилия 1", image: "image_1"))
        friends.append(Friend.init(firstName: "Имя 2", lastName: "Фамилия 2", image: "image_2"))
        friends.append(Friend.init(firstName: "Имя 3", lastName: "Фамилия 3", image: "image_3"))
        friends.append(Friend.init(firstName: "Имя 4", lastName: "Фамилия 4", image: "image_4"))
        friends.append(Friend.init(firstName: "Имя 5", lastName: "Фамилия 5", image: "image_5"))
        return friends
    }
}
