//
//  MyGroupsController.swift
//  weatherVk
//
//  Created by Арина Соколова on 14.05.2022.
//

import UIKit

class MyGroupsController: UITableViewController {
    
    var groups = [Group]()

    var sortedGroups = [Character: [Group]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sortedGroups = sort(groups: groups)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func sort(groups: [Group]) -> [Character: [Group]] {
        var groupsDict = [Character: [Group]]()
        
        groups.forEach() { group in
            
            guard let firstChar = group.nameGroup.first else {return}
            
            if var thisCharGroups = groupsDict[firstChar] {
                thisCharGroups.append(group)
                groupsDict[firstChar] = thisCharGroups
            } else {
                groupsDict[firstChar] = [group]
            }
        }
        return groupsDict
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedGroups.keys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keySorted = sortedGroups.keys.sorted() //массив отсортированных ключей
        
        let groups = sortedGroups[keySorted[section]]?.count ?? 0 //количество ячеек в определенной секции
        
        return groups
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupCell",
                                                       for: indexPath) as? MyGroupsCell else {
            preconditionFailure("Error")
        }

        let firstChar = sortedGroups.keys.sorted()[indexPath.section] //получили букву для конкретной секции
        
        let groups = sortedGroups[firstChar]! //получили массив групп для определенной секции
        
        let group: Group = groups[indexPath.row] //получили группу по номеру строки
        
        cell.myNameGroup.text = group.nameGroup   //последние действия
        cell.myImageGroup.image = group.photo
        // Configure the cell...

        return cell
    }

    @IBAction func addCity(segue: UIStoryboardSegue) {
        // Проверяем идентификатор, чтобы убедиться, что это нужная группа
        if segue.identifier == "addGroup" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            if let allGroupsController = segue.source as? AllGroupsController,
            // Получаем индекс выделенной ячейки
            let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                // Получаем группу по индексу
                let group = allGroupsController.groups[indexPath.row]
                if !groups.contains(where: { $0.nameGroup == group.nameGroup }) {
                    // Добавляем группу в список выбранных групп
                    groups.append(group)
                    // Обновляем таблицу
                    tableView.reloadData()
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(sortedGroups.keys.sorted()[section])
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            //удаляем группу из масcива
            groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

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
