//
//  FriendPhotoCollection.swift
//  1l_Dmitriy_Papkov
//
//  Created by Дмитрий Папков on 10/11/2018.
//  Copyright © 2018 Dmitriy Papkov. All rights reserved.
//

import UIKit

class FriendPhotoCollection: UICollectionViewController {
    
    var friend: [Friend] = [Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendPhotoCell", for: indexPath) as! PhotoCell
    
        cell.configureCell(friend: friend[indexPath.row])
    
        return cell
    }
}
