//
//  VideoViewCell.swift
//  Day03_PlayVideo
//
//  Created by zhaozhen on 16/12/8.
//  Copyright © 2016年 zhaozhen. All rights reserved.
//

import UIKit
struct video {
    let image: String
    let title: String
    let source: String
}
class VideoViewCell: UITableViewCell {

    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var playbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
