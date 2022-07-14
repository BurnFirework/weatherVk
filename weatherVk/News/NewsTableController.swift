//
//  NewsTableController.swift
//  weatherVk
//
//  Created by Арина Соколова on 11.07.2022.
//

import UIKit

class NewsTableController: UITableViewController {

    let news = [DataNews(imageNews: UIImage.init(named: "disneyPicture"),
                         textNews: "А вы знали, что существует и советская экранизация Бэмби?",
                         comments: ["Я люблю смотреть мультфильм \"бэмби\"", "Фильм так и называется \"Детство Бэмби\"?"],
                         numberOfViews: 0),
                DataNews(imageNews: UIImage.init(named: "matanTask"),
                         textNews: "Выкладываю одну весьма симпатичную и почти нетрудную задачку про кубический многочлен от одной буквы над полем. Прошу любить и жаловать !",
                        comments: ["А что значит вполне проводим?", "Хорошая задача"],
                         numberOfViews: 0),
                DataNews(imageNews: UIImage.init(named: "starDisc"),
                         textNews: "Стар против Сил Зла ещё выпускали на DVD дисках!",
                         comments: ["Я уверен, что это пиратка, понятно по лицевой обложке", "Прикольно. Я даже и не знала об этом.",
                                   "Ля какая обложка. А Тоффи тут прям кровожадный тиран. Робот убийца"],
                         numberOfViews: 0),
                DataNews(imageNews: UIImage.init(named: "pasha"),
                         textNews: "Павел Воля идет в IT вместе с GeekBrains 23 июня в 19:00 МСК",
                         comments: ["а будут курсы от бузовой о том, как стать аэрокосмическим инженером?"],
                         numberOfViews: 0),
                DataNews(imageNews: UIImage.init(named: "guse-1"),
                         textNews: "Этот гусь живет свою лучшую жизнь.",
                         comments: ["Это утка"],
                         numberOfViews: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "NewsCellXib", bundle: nil),
                           forCellReuseIdentifier: "NewsXib")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        news[indexPath.row].numberOfViews += 1
        performSegue(withIdentifier: "showPost", sender: self)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsXib",
                                                 for: indexPath) as? NewsCellXib else {
            preconditionFailure("Error")
        }

        cell.newsLabel.text = news[indexPath.row].textNews
        cell.newsImageView.image = news[indexPath.row].imageNews
        cell.counterViews.text = String(news[indexPath.row].numberOfViews)

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPost",
           let destinationVc = segue.destination as? PostViewController,
           let indexPath = tableView.indexPathForSelectedRow {            
            destinationVc.dataNews = news[indexPath.row]
        }
        tableView.reloadData()
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
