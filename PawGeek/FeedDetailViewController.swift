//
//  FeedDetailViewController.swift
//  PawGeek
//
//  Created by Ueto Utamuro on 7/3/17.
//  Copyright © 2017 Ueto Utamuro. All rights reserved.
//

import UIKit
import QuartzCore

class FeedDetailViewController: UIViewController {
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var feedView: UIView!
    @IBOutlet weak var postTitleLbl: UILabel!
    @IBOutlet weak var postSubTitleLbl: UILabel!
    @IBOutlet weak var postTimeLbl: UILabel!
    @IBOutlet weak var postDateLbl: UILabel!
    @IBOutlet weak var feedContentView: UIView!
    @IBOutlet weak var postUserPhotoImgView: UIImageView!
    @IBOutlet weak var postUserNameLbl: UILabel!
    @IBOutlet weak var userFeedContent: UILabel!
    @IBOutlet weak var postUserLevelLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileBtn.layer.cornerRadius=self.profileBtn.frame.width/2
        self.profileBtn.backgroundColor=UIColor.red
        self.postUserPhotoImgView.layer.cornerRadius=self.postUserPhotoImgView.frame.width/2
        self.postUserPhotoImgView.backgroundColor=UIColor.red
        self.postUserLevelLbl.layer.cornerRadius=10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backBtnClicked(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func profileBtnClicked(_ sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
