//
//  MenuItem.swift
//  TalkingHandsApp
//
//  Created by Sandra on 20/04/20.
//  Copyright © 2020 TalkingHands. All rights reserved.
//

import UIKit

class MenuItem: NSObject {
    var id:Int?
    var title:String?
    var section:String?
    var image:UIImage?
    var modules:NSArray?
    var status:Bool?
    
    init(withDictionary dictionary:NSDictionary){
        self.id = dictionary.object(forKey: "id") as? Int ?? 0
        self.title = dictionary.object(forKey: "title") as? String ?? ""
        self.section = dictionary.object(forKey: "section") as? String ?? ""
        self.status = dictionary.object(forKey: "status") as? Bool ?? false
        let image = dictionary.object(forKey: "image") as? String ?? ""
        if image != "" {
            self.image = UIImage(named: image)
        }
        self.modules = dictionary.object(forKey: "modules") as? NSArray ?? []
    }

}
