//
//  CommentPostViewController.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/08.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentPostViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentText: UITextField!
    
    var postDataSegue: PostData!
    
    @IBAction func postButton(_ sender: Any) {
        
//        let postData = postDataSegue
        
        // 中身の確認用　"comments"内がすべて表示される　⭕️
        print(postDataSegue.comments)
        
        if let commentText = commentText.text {
            // 入力されていない時はHUDを出して何もしない
            if commentText.isEmpty {
            SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
            return
            }
        }
        
        // 投稿者とコメントの準備
        let userName = Auth.auth().currentUser?.displayName
        let commentRef = Database.database().reference().child(Const.PostPath).child(postDataSegue.id!)
        let commentSet = "\(userName!): \(commentText.text!)"
        
        // 配列に加える
        postDataSegue.comments.append(commentSet)
        
        let comment = ["comments": postDataSegue.comments]
        commentRef.updateChildValues(comment as [AnyHashable : Any])

        SVProgressHUD.showError(withStatus: "コメントを投稿しました。")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userNameLabel.text = "\(postDataSegue.name!)さんの投稿にコメントする。"
    }
    
}
