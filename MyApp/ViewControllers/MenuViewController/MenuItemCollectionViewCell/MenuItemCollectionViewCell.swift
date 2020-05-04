//
//  MenuItemCollectionViewCell.swift
//  TalkingHandsApp
//
//  Created by Sandra on 20/04/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    var item:MenuItem?
    @IBOutlet weak private var imgModule: UIImageView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblSection: UILabel?
    @IBOutlet weak var viewContainer: UIView?
    @IBOutlet weak var viewEnabled: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewEnabled?.layer.cornerRadius = 20
        self.viewContainer?.layer.cornerRadius = 20
        self.viewContainer?.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 12.0;
        self.layer.shadowOpacity = 0.7;
    }
    
    func updateContent(withItem item:MenuItem){
        self.item = item
        self.lblTitle?.text = item.title
        self.lblSection?.text = item.section
        self.imgModule?.image = item.image
        self.viewEnabled?.isHidden = item.status ?? false
    }
    

}
