//
//  CommnMethods.swift
//  EngeneeringAITask
//
//  Created by VijenderBandari on 20/01/20.
//  Copyright © 2020 VijenderBandari. All rights reserved.
//

import UIKit

class CommnMethods: NSObject {
    func convertDictToPostsModel(withDict : [[String:Any]])-> [Posts]{
        var postArray = [Posts]()
        for data in withDict {
            let post = Posts.init(withData: data)
            postArray.append(post)
        }
       return postArray
    }
    

}
