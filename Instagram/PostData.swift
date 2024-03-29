//
//  PostData.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/06.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
//    var comment: String?
//    var commentUser: String?
    var comments: [String] = []
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
//        let commentDictionary = snapshot.value as? [String: NSArray]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
//        self.comment = valueDictionary["comment"] as? String
        
//        self.commentUser = valueDictionary["commentUser"] as? String
 
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        if let comments = valueDictionary["comments"] as? [String] {
            self.comments = comments
        }
        
        for likeID in self.likes {
            if likeID == myId {
                self.isLiked = true
                break
            }
        }
    }
}
