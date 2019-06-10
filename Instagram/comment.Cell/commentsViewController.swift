//
//  commentsViewController.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/09.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseDatabase

class commentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var commentTableView: UITableView!
    
    var postDataSegue: PostData!
    
    var commentArray: [String] = []
    
    private let Sections: NSArray = ["コメント一覧"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        loadData()
        
        // テーブルセルのタップを無効にする
        commentTableView.allowsSelection = false
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(commentsViewController.rightSwipeView(sender:)))
        // ライトスワイプのみ反応するようにする
        rightSwipe.direction = .right
        // viewにジェスチャーを登録
        self.view.addGestureRecognizer(rightSwipe)

        
        let nib = UINib(nibName: "commentTableViewCell", bundle: nil)
        commentTableView.register(nib, forCellReuseIdentifier: "commentCell")
        
    }
    
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count: \(commentArray.count)")
        return commentArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = commentArray[indexPath.row]
        
        return cell
    }

    @objc func rightSwipeView(sender: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        self.commentArray = postDataSegue.comments

//        // 1つずつの表示確認　⭕️
//        for comment in commentArray {
//            print(comment)
//        }
//
    }
    

}
