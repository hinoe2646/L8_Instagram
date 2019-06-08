//
//  CommentPostViewController.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/08.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD

class CommentPostViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentText: UITextField!
    
    // prepareで受け取ったidが入った引数を書く
    var postDataSegue: PostData!
    
    @IBAction func postButton(_ sender: Any) {
        
        let postData = postDataSegue
        
        // コメントをFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comment = ["comment": commentText.text]
//        postRef.updateChildValues(comment)
        print("DEBUG_PRINT: \(postRef)")
        print("DEBUG_PRINT: \(comment)")
        print("DEBUG_PRINT: コメントを追加しました。")
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

        // 表示名を取得してTextFieldに設定する
        let user = Auth.auth().currentUser
        if let user = user {
            userNameLabel.text = user.displayName
            
//        print("DEBUG_PRINT: \(postDataSegue)")
        }
    }
    
}
