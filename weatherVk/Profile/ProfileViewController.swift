//
//  ProfileViewController.swift
//  weatherVk
//
//  Created by Арина Соколова on 14.05.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProfileViewController: UICollectionViewController {
    var user: User? {
        didSet {
            self.collectionView!.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    @objc func photosTap(_: UITapGestureRecognizer) {
       performSegue(withIdentifier: "PhotosScreen", sender: nil)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell",
                                                            for: indexPath) as? ProfileViewCell else {
            preconditionFailure("Error")
        }
        cell.nameFriend.text = user?.nameFriend
        cell.profileImage.image = user?.avatar
        cell.profileImage.layer.cornerRadius = cell.profileImage.layer.bounds.height / 2 + 30
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoScreen",
           let destinationVc = segue.destination as? PhotosViewController {
            destinationVc.photos = user!.photos
        }
    }
}
