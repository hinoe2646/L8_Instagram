//
//  CommentViewController.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/06.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    // コメントの投稿ボタンをタップしたときに呼ばれるメソッド
    @IBAction func handleCommentButton(_ sender: Any) {
        if let nameText = nameTextField.text, let commentText = commentTextField.text {
            // どちらも入力されていない時はHUDを出して何もしない
            if nameText.isEmpty || commentText.isEmpty {
                SVProgressHUD.showError(withStatus: "必要項目を入力して下さい")
                return
            }
            
//        // postDataに必要な情報を取得しておく
//        let name = Auth.auth().currentUser?.displayName
//
//
//        // 辞書を作成してFirebaseに保存する
//        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
//        let comments = ["comment": textField.text!, "name": name!]
//        postRef.updateChildValues(comments)
//
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
        
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
        }
    }

    // キャンセルボタンをタップしたときに呼ばれるメソッド
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 表示名を取得してTextFieldに設定する
        let user = Auth.auth().currentUser
        if let user = user {
            nameTextField.text = user.displayName
        }
    }
    
}
