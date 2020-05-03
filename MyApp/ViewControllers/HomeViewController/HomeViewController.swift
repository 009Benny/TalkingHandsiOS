//
//  HomeViewController.swift
//  TalkingHandsApp
//
//  Created by Sandra on 3/6/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var homeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTable.delegate = self
        self.homeTable.dataSource = self
        self.homeTable.register(UINib(nibName: "ItemSecctionTableViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.view.layoutIfNeeded()
//        self.homeTable.layoutIfNeeded()
//        self.homeTable.reloadData()
    }

    //MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ItemSecctionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemSecctionTableViewCell
//        cell.setData(data: )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height*0.75;
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
