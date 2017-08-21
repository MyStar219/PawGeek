//
//  FeedViewController.swift
//  PawGeek
//
//  Created by Ueto Utamuro on 7/3/17.
//  Copyright © 2017 Ueto Utamuro. All rights reserved.
//

import UIKit
import QuartzCore

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var searchTField: UITextField!
    @IBOutlet weak var menuBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedTableView.delegate=self
        self.feedTableView.dataSource=self
        self.menuBtn.layer.cornerRadius=self.menuBtn.frame.width/2
        self.menuBtn.backgroundColor=UIColor.darkGray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TableView Delegate Method
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = feedTableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath as IndexPath) as! FeedTableViewCell
        cell.postUserPhoto.layer.cornerRadius=cell.postUserPhoto.frame.width/2
        cell.postUserPhoto.backgroundColor=UIColor.red
        cell.feedPhoto1.layer.cornerRadius=cell.feedPhoto1.frame.width/2
        cell.feedPhoto1.backgroundColor=UIColor.yellow
        cell.feedPhoto2.layer.cornerRadius=cell.feedPhoto2.frame.width/2
        cell.feedPhoto2.backgroundColor=UIColor.green
        cell.feedPhoto3.layer.cornerRadius=cell.feedPhoto3.frame.width/2
        cell.feedPhoto3.backgroundColor=UIColor.lightGray
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "FeedDetailViewController") as! FeedDetailViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    @IBAction func menuBtnClicked(_ sender: UIButton) {
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
