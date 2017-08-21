//
//  DashboardViewController.swift
//  PawGeek
//
//  Created by Ueto Utamuro on 7/3/17.
//  Copyright © 2017 Ueto Utamuro. All rights reserved.
//

import UIKit
import QuartzCore

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var dashboardTableView: UITableView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var editNameLbl: UILabel!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var editProfileView: UIView!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var nameTField: UITextField!
    @IBOutlet weak var emailTField: UITextField!
    @IBOutlet weak var phoneTField: UITextField!
    @IBOutlet weak var zipTField: UITextField!
    @IBOutlet weak var ratingView: UIView!
    
    let allIcons = Icons.allIcons
    var icon = Icons.bag
    
    var items: [String] = ["We", "Heart", "Swift"]
    var items1: [String] = ["hello how are you?", "What are you doing now?", "Thanks"]
    var items2 : [String] = ["30 minutes", "15 minutes", "10 minutes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dashboardTableView.delegate=self
        self.dashboardTableView.dataSource=self
        self.profileBtn.isEnabled=true
        self.upcomingView.isHidden=false
        self.dashboardTableView.isHidden=false
        self.profileView.isHidden=true
        self.plusBtn.isHidden=true
        self.editProfileView.isHidden=true
        profileBtn.layer.cornerRadius=profileBtn.frame.width/2
        profileBtn.layer.backgroundColor=UIColor.red.cgColor
        levelLbl.backgroundColor=UIColor.darkGray
        levelLbl.layer.cornerRadius=levelLbl.frame.height/2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TableView Delegate Method
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dashboardTableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath as IndexPath) as! DashboardTableViewCell
        cell.upcomingView.layer.cornerRadius=20
        cell.upcomingView.backgroundColor=UIColor.white
        cell.upcomingView.layer.borderWidth=2
        cell.upcomingView.layer.borderColor=UIColor(hex: "e4e7e6").cgColor
        cell.upcomingTitle.text=self.items[indexPath.row]
        cell.upcomingContent.text=self.items1[indexPath.row]
        cell.upcomingTime.text=self.items2[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(items[indexPath.row])
    }
    
    @IBAction func profileBtnClicked(_ sender: UIButton) {
        self.profileView.isHidden=false
        self.dashboardTableView.isHidden=true
        self.editProfileView.isHidden=true
        self.upcomingView.isHidden=true
        self.plusBtn.isHidden=true
        self.profileBtn.isEnabled=false
    }
    @IBAction func editProfileBtnClicked(_ sender: UIButton) {
        self.dashboardTableView.isHidden=true
        self.profileView.isHidden=true
        self.upcomingView.isHidden=true
        self.editProfileView.isHidden=false
        self.plusBtn.isHidden=false
        self.plusBtn.layer.cornerRadius=plusBtn.frame.width/2
        self.plusBtn.backgroundColor=UIColor(hex: "FC7E10")
    }

    @IBAction func resetPasswordBtnClicked(_ sender: UIButton) {
    }

    @IBAction func doneEditingBtnClicked(_ sender: UIButton) {
        self.dashboardTableView.isHidden=false
        self.profileView.isHidden=true
        self.editProfileView.isHidden=true
        self.plusBtn.isHidden=true
        self.upcomingView.isHidden=false
    }
    @IBAction func plusBtnClicked(_ sender: UIButton) {
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

//CollectionView Delegate Method

extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        icon = Icons.icon(forTag: indexPath.row)
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! IconCell
        cell.icon = allIcons[indexPath.row]
        
        return cell
    }
}

// UIColor Change Method

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
