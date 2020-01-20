//
//  Posts.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

class Posts: NSObject {
    var post_title : String!
    var created_at : String!
    var isActiveAndDeactiveSelected : Bool = false
    
    required init(withData : [String : Any]) {
        let _highlightResultData = withData["_highlightResult"] as! [String : Any]
        
        if(withData["created_at"] != nil){
            self.created_at = (withData["created_at"] as! String).convertdateToFormate(formate: "dd MMM YYY");
        }else{
           self.created_at =  ""
        }
        
        if(_highlightResultData["title"] != nil){
            self.post_title = ((_highlightResultData["title"] as! [String:Any])["value"] as! String);
        }else{
           self.post_title = ""
        }
       
    }

}
