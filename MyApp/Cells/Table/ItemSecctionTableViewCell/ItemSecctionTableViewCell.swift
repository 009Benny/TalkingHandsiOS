//
//  ItemSecctionTableViewCell.swift
//  TalkingHandsApp
//
//  Created by Sandra on 3/6/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class ItemSecctionTableViewCell: UITableViewCell {

    @IBOutlet weak var viewContent: UIView?
    @IBOutlet weak var imgItem: UIImageView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblNivel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewContent?.layer.cornerRadius = 15
        self.viewContent?.layer.shadowColor = UIColor.black.cgColor
        self.viewContent?.layer.shadowOpacity = 0.4
        self.viewContent?.layer.shadowOffset = .init(width: 2, height: 2)
        self.viewContent?.layer.shadowRadius = 15
    }
    
    func setData(data:NSDictionary){
        self.lblTitle?.text = data.object(forKey: "title") as? String ?? ""
        self.lblNivel?.text = data.object(forKey: "section") as? String ?? ""
        self.imgItem?.image = UIImage(named: data.object(forKey: "image") as! String)
    }
    
}
