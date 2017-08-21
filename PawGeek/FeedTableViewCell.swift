//
//  FeedTableViewCell.swift
//  PawGeek
//
//  Created by Ueto Utamuro on 7/3/17.
//  Copyright © 2017 Ueto Utamuro. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postSubTitle: UILabel!
    @IBOutlet weak var postContent: UILabel!
    @IBOutlet weak var postUserPhoto: UIImageView!
    @IBOutlet weak var postUserName: UILabel!
    
    @IBOutlet weak var postUserPhoneNumber: UILabel!
    @IBOutlet weak var feedPhoto1: UIImageView!
    @IBOutlet weak var feedPhoto2: UIImageView!
    @IBOutlet weak var feedPhoto3: UIImageView!
    @IBOutlet weak var feedContent: UILabel!
    @IBOutlet weak var postUserLevel: UILabel!
    @IBOutlet weak var feedBtn: UIButton!
    @IBOutlet weak var mesageBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
