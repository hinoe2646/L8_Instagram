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
    
    @IBOutlet weak var textField: UITextField!
    
    // コメントの投稿ボタンをタップしたときに呼ばれるメソッド
    @IBAction func handleCommentButton(_ sender: Any) {
        if let commentText = textField.text {
            // 表示名が入力されていない時はHUDを出して何もしない
            if commentText.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
            }
            
        // postDataに必要な情報を取得しておく
        let name = Auth.auth().currentUser?.displayName
            
        // タップされたセルのインデックスを求める
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.tableView)
        let indexPath = tableView.indexPathForRow(at: point)
        
        // 配列からタップされたインデックスのデータを取り出す
        let postData = postArray[indexPath!.row]
        
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comment": textField.text!, "name": name!]
        postRef.updateChildValues(comments)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }

    // キャンセルボタンをタップしたときに呼ばれるメソッド
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
