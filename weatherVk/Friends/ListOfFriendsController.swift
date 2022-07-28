//
//  ListOfFriendsController.swift
//  weatherVk
//
//  Created by Арина Соколова on 13.05.2022.
//

import UIKit

class ListOfFriendsController: UITableViewController {
    
    let friends = [
        User(avatarFriend: UIImage.init(named: "marinett")!, nameFriend: "Маринетт Дюпэн-Чэн",
             photos: [UIImage.init(named: "marinett")!, UIImage.init(named: "marinett2")!, UIImage.init(named: "marinett3")!, UIImage.init(named: "marinettAndBug")!]),
        User(avatarFriend: UIImage.init(named: "adrian")!, nameFriend: "Адриан Агрест",
             photos: [UIImage.init(named: "adrian")!, UIImage.init(named: "adrian2")!, UIImage.init(named: "adrian3")!, UIImage.init(named: "adrian4")!]),
        User(avatarFriend: UIImage.init(named: "ladyBug")!, nameFriend: "Леди Баг",
             photos: [UIImage.init(named: "ladyBug")!, UIImage.init(named: "ladyBug2")!, UIImage.init(named: "ladyBug3")!]),
        User(avatarFriend: UIImage.init(named: "superCat")!, nameFriend: "Супер Кот",
             photos: [UIImage.init(named: "superCat")!, UIImage.init(named: "ladyBug3")!, UIImage.init(named: "superCat2")!, UIImage.init(named: "superCat3")!, UIImage.init(named: "superCat4")!]),
        User(avatarFriend: UIImage.init(named: "Alya")!, nameFriend: "Алья Сезер",
             photos: [UIImage.init(named: "Alya")!, UIImage.init(named: "Alya4")!]),
        User(avatarFriend: UIImage.init(named: "nino")!, nameFriend: "Нино Лейф",
             photos: [UIImage.init(named: "nino")!]),
        User(avatarFriend: UIImage.init(named: "chloi")!, nameFriend: "Хлоя Буржуа",
             photos: [UIImage.init(named: "chloi")!, UIImage.init(named: "chloi4")!]),
        User(avatarFriend: UIImage.init(named: "luka")!, nameFriend: "Лука Куффен",
             photos: [UIImage.init(named: "luka")!, UIImage.init(named: "luka2")!, UIImage.init(named: "luka3")!, UIImage.init(named: "luka4")!])
    ]

    var sortedFriends = [Character: [User]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sortedFriends = sort(friends: friends)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func sort(friends: [User]) -> [Character: [User]] {
        var friendsDict = [Character: [User]]()
        
        friends.forEach() { friend in
            
            guard let firstChar = friend.nameFriend.split(separator: " ")[1].first else {return}
            
            if var thisCharFriends = friendsDict[firstChar] {
                thisCharFriends.append(friend)
                friendsDict[firstChar] = thisCharFriends
            } else {
                friendsDict[firstChar] = [friend]
            }
        }
        return friendsDict
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedFriends.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keySorted = sortedFriends.keys.sorted() //массив отсортированных ключей
        
        let friends = sortedFriends[keySorted[section]]?.count ?? 0 //количество ячеек в определенной секции
        
        return friends
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell",
                                                       for: indexPath) as? FriendCell else {
            preconditionFailure("Error")
        }

        let firstChar = sortedFriends.keys.sorted()[indexPath.section] //получили букву для конкретной секции
        
        let friends = sortedFriends[firstChar]! //получили массив друзей для определенной секции
        
        let friend: User = friends[indexPath.row] //получили пользователя по номеру строки
        
        cell.friendNameLabel.text = friend.nameFriend
        cell.friendsAvatarView.image = friend.avatar
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FriendCell else {
            preconditionFailure("Error")
        }
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
            cell.friendsAvatarView.frame.size.height *= 1.1
            cell.friendsAvatarView.frame.size.width *= 1.1
        }) { _ in
            self.performSegue(withIdentifier: "showProfile", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProfile",
           let destinationVc = segue.destination as? ProfileViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            let firstChar = sortedFriends.keys.sorted()[indexPath.section]
            let sectionFriends = sortedFriends[firstChar]!
            let friend: User = sectionFriends[indexPath.row]
            
            destinationVc.user = friend
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedFriends.keys.sorted()[section])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
