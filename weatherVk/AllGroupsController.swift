//
//  AllGroupsController.swift
//  weatherVk
//
//  Created by Арина Соколова on 14.05.2022.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    let groups = [
        Group(photoGroup: UIImage.init(named: "memmsu"), nameGroup: "мемгу"),
        Group(photoGroup: UIImage.init(named: "matan"), nameGroup: "Ёжик в матане"),
        Group(photoGroup: UIImage.init(named: "star"), nameGroup: "Стар против Сил Зла"),
        Group(photoGroup: UIImage.init(named: "GeekBrains"), nameGroup: "GeekBrains"),
        Group(photoGroup: UIImage.init(named: "guse"), nameGroup: "контур гуся"),
        Group(photoGroup: UIImage.init(named: "english"), nameGroup: "Учим английский язык"),
        Group(photoGroup: UIImage.init(named: "disney"), nameGroup: "Walt Disney Pictures"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell",
                                                       for: indexPath) as? AllGroupsCell else {
            preconditionFailure("Error")
        }

        cell.nameGroup.text = groups[indexPath.row].nameGroup
        cell.imageGroup.image = groups[indexPath.row].photo
        // Configure the cell...

        return cell
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
