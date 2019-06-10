//
//  CommentAllViewController.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/10.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit

class CommentAllViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var textLabel: UILabel!
   
    var postDataSegue: PostData!
    
    var commentArray: [String] = []
    
    var commentSet = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // textViewの行間を設定
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = 20
//        let attributes = [NSAttributedString.Key.paragraphStyle : style]
//        textView.attributedText = NSAttributedString(string: textView.text,attributes: attributes)
    
        loadData_Firebase()

    }
    
    func loadData_Firebase() {
        print("データ取得アクセス")
        
        // 中身の確認用　"comments"内がすべて表示される　⭕️
        print("中身の確認: \(postDataSegue.comments)")
        
        self.commentArray = postDataSegue.comments
        
        // 1つずつの表示確認　⭕️
        for comment in commentArray {
            print(comment)
            commentSet = commentSet + "\n" + String(comment)
        }
        
        textLabel.text = commentSet
        
    }
    
    @IBAction func returnButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
