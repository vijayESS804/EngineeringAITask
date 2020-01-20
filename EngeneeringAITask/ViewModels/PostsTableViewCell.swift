//
//  PostsTableViewCell.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var createdDateLbl: UILabel!
    @IBOutlet weak var acticiveAndDectiveSwitch: UISwitch!
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // set values to cell here
    func setValues(post:Posts){
        self.createdDateLbl.text = post.created_at
        self.createdDateLbl.numberOfLines = 0
        self.createdDateLbl.sizeToFit()
        self.titleLable.text = post.post_title
        self.titleLable.numberOfLines = 0;
        self.titleLable.sizeToFit()
        self.acticiveAndDectiveSwitch.isOn = post.isActiveAndDeactiveSelected
        self.contentView.backgroundColor = post.isActiveAndDeactiveSelected ? UIColor.lightGray : UIColor.white
        
    }
    
}
