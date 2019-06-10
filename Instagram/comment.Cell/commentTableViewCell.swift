//
//  commentTableViewCell.swift
//  Instagram
//
//  Created by 石井 美記夫 on 2019/06/09.
//  Copyright © 2019 hinoe2646. All rights reserved.
//

import UIKit

class commentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    
    var postDataSegue: PostData!
    
    var commentArray: Array<Any> = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData() {
            commentLabel.text = "comment data"
    }
    
}
