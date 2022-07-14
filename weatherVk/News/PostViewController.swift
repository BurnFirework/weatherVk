//
//  PostViewController.swift
//  weatherVk
//
//  Created by Арина Соколова on 12.07.2022.
//

import UIKit

class PostViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var tableComments: UITableView!
    @IBOutlet weak var sendComment: SendComment!
    @IBOutlet weak var commentText: UITextField!
    
    var dataNews: DataNews?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let post = dataNews {
            newsImage.image = post.imageNews
            textLabel.text = post.textNews
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(updateArray))
        tap.numberOfTapsRequired = 1
        sendComment.addGestureRecognizer(tap)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataNews!.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "comment",
                                                            for: indexPath) as? CommentCell else {
            preconditionFailure("Error")
        }
        cell.commentText.text = dataNews!.comments[indexPath.row]
        return cell
    }
    
    
    @objc func updateArray(_: UITapGestureRecognizer) {
        if let textComment = commentText.text, textComment != "" {
            dataNews!.comments.append(textComment)
            tableComments.reloadData()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
